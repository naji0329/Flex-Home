import {ActionsService} from './ActionsService';
import {Helpers} from '../Helpers/Helpers';

export class ContextMenuService {
    static initContext() {
        if (jQuery().contextMenu) {
            $.contextMenu({
                selector: '.js-context-menu[data-context="file"]',
                build: () => {
                    return {
                        items: ContextMenuService._fileContextMenu(),
                    };
                },
            });

            $.contextMenu({
                selector: '.js-context-menu[data-context="folder"]',
                build: () => {
                    return {
                        items: ContextMenuService._folderContextMenu(),
                    };
                },
            });
        }
    }

    static _fileContextMenu() {
        let items = {
            preview: {
                name: 'Preview',
                icon: (opt, $itemElement, itemKey, item) => {
                    $itemElement.html('<i class="fa fa-eye" aria-hidden="true"></i> ' + item.name);

                    return 'context-menu-icon-updated';
                },
                callback: () => {
                    ActionsService.handlePreview();
                }
            },
        };

        _.each(Helpers.getConfigs().actions_list, (actionGroup, key) => {
            _.each(actionGroup, value => {
                items[value.action] = {
                    name: value.name,
                    icon: (opt, $itemElement, itemKey, item) => {
                        $itemElement.html('<i class="' + value.icon + '" aria-hidden="true"></i> ' + (RV_MEDIA_CONFIG.translations.actions_list[key][value.action] || item.name));

                        return 'context-menu-icon-updated';
                    },
                    callback: () => {
                        $('.js-files-action[data-action="' + value.action + '"]').trigger('click');
                    }
                };
            })
        });

        let except = [];

        switch (Helpers.getRequestParams().view_in) {
            case 'all_media':
                except = ['remove_favorite', 'delete', 'restore'];
                break;
            case 'recent':
                except = ['remove_favorite', 'delete', 'restore', 'make_copy'];
                break;
            case 'favorites':
                except = ['favorite', 'delete', 'restore', 'make_copy'];
                break;
            case 'trash':
                items = {
                    preview: items.preview,
                    rename: items.rename,
                    download: items.download,
                    delete: items.delete,
                    restore: items.restore,
                };
                break;
        }

        _.each(except, (value) => {
            items[value] = undefined;
        });

        let hasFolderSelected = Helpers.getSelectedFolder().length > 0;

        if (hasFolderSelected) {
            items.preview = undefined;
            items.copy_link = undefined;

            if (!_.includes(RV_MEDIA_CONFIG.permissions, 'folders.create')) {
                items.make_copy = undefined;
            }

            if (!_.includes(RV_MEDIA_CONFIG.permissions, 'folders.edit')) {
                items.rename = undefined;
            }

            if (!_.includes(RV_MEDIA_CONFIG.permissions, 'folders.trash')) {
                items.trash = undefined;
                items.restore = undefined;
            }

            if (!_.includes(RV_MEDIA_CONFIG.permissions, 'folders.destroy')) {
                items.delete = undefined;
            }

            if (!_.includes(RV_MEDIA_CONFIG.permissions, 'folders.favorite')) {
                items.favorite = undefined;
                items.remove_favorite = undefined;
            }
        }

        let selectedFiles = Helpers.getSelectedFiles();

        if (selectedFiles.length > 0) {
            if (!_.includes(RV_MEDIA_CONFIG.permissions, 'files.create')) {
                items.make_copy = undefined;
            }

            if (!_.includes(RV_MEDIA_CONFIG.permissions, 'files.edit')) {
                items.rename = undefined;
            }

            if (!_.includes(RV_MEDIA_CONFIG.permissions, 'files.trash')) {
                items.trash = undefined;
                items.restore = undefined;
            }

            if (!_.includes(RV_MEDIA_CONFIG.permissions, 'files.destroy')) {
                items.delete = undefined;
            }

            if (!_.includes(RV_MEDIA_CONFIG.permissions, 'files.favorite')) {
                items.favorite = undefined;
                items.remove_favorite = undefined;
            }
        }

        let canPreview = false;
        _.each(selectedFiles, (value) => {
            if (_.includes(['image', 'pdf', 'text', 'video'], value.type)) {
                canPreview = true;
            }
        });

        if (!canPreview) {
            items.preview = undefined;
        }

        return items;
    }

    static _folderContextMenu() {
        let items = ContextMenuService._fileContextMenu();

        items.preview = undefined;
        items.copy_link = undefined;

        return items;
    }

    static destroyContext() {
        if (jQuery().contextMenu) {
            $.contextMenu('destroy');
        }
    }
}
