Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4AC92A3FDD
	for <lists+linux-omap@lfdr.de>; Tue,  3 Nov 2020 10:21:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726581AbgKCJVK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 3 Nov 2020 04:21:10 -0500
Received: from mga18.intel.com ([134.134.136.126]:58289 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725988AbgKCJVJ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 3 Nov 2020 04:21:09 -0500
IronPort-SDR: cHZr9KlyNTXQrKPxNYMlPZGpBhvpLmPwIC6yYu3YIVmtAdp8NHbMm4kb+teAps4GmPYbiH3NEc
 edimbDA+iyeg==
X-IronPort-AV: E=McAfee;i="6000,8403,9793"; a="156803046"
X-IronPort-AV: E=Sophos;i="5.77,447,1596524400"; 
   d="gz'50?scan'50,208,50";a="156803046"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2020 01:21:06 -0800
IronPort-SDR: y8j6UcrgG32Pi98FRsLPFNc2Lp1FIyBJkjNqUlsesv1txBxfhodaX+1W/LUqY9D1dW3uOPOh15
 8VjJAVXn4S4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,447,1596524400"; 
   d="gz'50?scan'50,208,50";a="353142365"
Received: from lkp-server02.sh.intel.com (HELO e61783667810) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 03 Nov 2020 01:21:02 -0800
Received: from kbuild by e61783667810 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kZsUw-000094-6a; Tue, 03 Nov 2020 09:21:02 +0000
Date:   Tue, 3 Nov 2020 17:20:31 +0800
From:   kernel test robot <lkp@intel.com>
To:     Carl Philipp Klemm <philipp@uvos.xyz>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>, tony@atomide.com
Cc:     kbuild-all@lists.01.org, linux-omap@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v3] ARM: dts: motorola-mapphone-common: Add dts
 configureation for the android buttons beneath the screen
Message-ID: <202011031755.GhZYr9dh-lkp@intel.com>
References: <20201030100550.010bfe4f3cdc2f4e5a599c8b@uvos.xyz>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="n8g4imXOkfNTN/H1"
Content-Disposition: inline
In-Reply-To: <20201030100550.010bfe4f3cdc2f4e5a599c8b@uvos.xyz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--n8g4imXOkfNTN/H1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Carl,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on input/next]
[also build test WARNING on omap/for-next balbi-usb/testing/next v5.10-rc2 next-20201103]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Carl-Philipp-Klemm/ARM-dts-motorola-mapphone-common-Add-dts-configureation-for-the-android-buttons-beneath-the-screen/20201030-170644
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
config: riscv-randconfig-r013-20201030 (attached as .config)
compiler: riscv32-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/7a00d245fade30bef33d962c11b7bc121c007910
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Carl-Philipp-Klemm/ARM-dts-motorola-mapphone-common-Add-dts-configureation-for-the-android-buttons-beneath-the-screen/20201030-170644
        git checkout 7a00d245fade30bef33d962c11b7bc121c007910
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=riscv 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/input/misc/touchscreen-buttons.c: In function 'touchscreen_buttons_input_event':
   drivers/input/misc/touchscreen-buttons.c:187:34: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
     187 |      && buttons->queue.lastindex >= 0) {
         |                                  ^~
   drivers/input/misc/touchscreen-buttons.c: At top level:
>> drivers/input/misc/touchscreen-buttons.c:240:6: warning: no previous prototype for 'merge_task_handler' [-Wmissing-prototypes]
     240 | void merge_task_handler(struct work_struct *work)
         |      ^~~~~~~~~~~~~~~~~~
>> drivers/input/misc/touchscreen-buttons.c:252:6: warning: no previous prototype for 'close_task_handler' [-Wmissing-prototypes]
     252 | void close_task_handler(struct work_struct *work)
         |      ^~~~~~~~~~~~~~~~~~
>> drivers/input/misc/touchscreen-buttons.c:263:6: warning: no previous prototype for 'open_task_handler' [-Wmissing-prototypes]
     263 | void open_task_handler(struct work_struct *work)
         |      ^~~~~~~~~~~~~~~~~
>> drivers/input/misc/touchscreen-buttons.c:411:5: warning: no previous prototype for 'touchscreen_buttons_idev_opened' [-Wmissing-prototypes]
     411 | int touchscreen_buttons_idev_opened(struct input_dev *idev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/input/misc/touchscreen-buttons.c:434:6: warning: no previous prototype for 'touchscreen_buttons_idev_closed' [-Wmissing-prototypes]
     434 | void touchscreen_buttons_idev_closed(struct input_dev *idev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

vim +/merge_task_handler +240 drivers/input/misc/touchscreen-buttons.c

   239	
 > 240	void merge_task_handler(struct work_struct *work)
   241	{
   242		struct touchscreen_buttons *buttons =
   243		    container_of(work, struct touchscreen_buttons, merge_task);
   244	
   245		mutex_lock(&buttons->mutex);
   246		if (buttons->ts_handle && buttons->ts_handle->dev)
   247			touchscreen_buttons_merge_capabilitys(buttons->filtered_ts_idev,
   248							      buttons->ts_handle->dev);
   249		mutex_unlock(&buttons->mutex);
   250	}
   251	
 > 252	void close_task_handler(struct work_struct *work)
   253	{
   254		struct touchscreen_buttons *buttons =
   255		    container_of(work, struct touchscreen_buttons, close_task);
   256	
   257		mutex_lock(&buttons->mutex);
   258		if (buttons && buttons->ts_handle && buttons->ts_handle->open != 0)
   259			input_close_device(buttons->ts_handle);
   260		mutex_unlock(&buttons->mutex);
   261	}
   262	
 > 263	void open_task_handler(struct work_struct *work)
   264	{
   265		struct touchscreen_buttons *buttons =
   266		    container_of(work, struct touchscreen_buttons, open_task);
   267		int error;
   268	
   269		mutex_lock(&buttons->mutex);
   270		if (buttons && buttons->ts_handle) {
   271			error = input_open_device(buttons->ts_handle);
   272			if (error) {
   273				dev_err(buttons->dev,
   274					"Failed to open input device, error %d\n",
   275					error);
   276				input_unregister_handle(buttons->ts_handle);
   277				kfree(buttons->ts_handle);
   278				buttons->ts_handle = NULL;
   279			}
   280		}
   281		mutex_unlock(&buttons->mutex);
   282	}
   283	
   284	static int touchscreen_buttons_input_connect(struct input_handler *handler,
   285						     struct input_dev *dev,
   286						     const struct input_device_id *id)
   287	{
   288		struct touchscreen_buttons *buttons;
   289	
   290		buttons = handler->private;
   291	
   292		mutex_lock(&buttons->mutex);
   293	
   294		if ((!buttons->ts_handle
   295		     && device_match_of_node(&dev->dev, buttons->map->ts_node))
   296		    || (dev->dev.parent
   297			&& device_match_of_node(dev->dev.parent,
   298						buttons->map->ts_node))) {
   299			int error;
   300	
   301			dev_info(buttons->dev, "Binding to device: %s\n",
   302				 dev_name(&dev->dev));
   303	
   304			buttons->ts_handle =
   305			    kzalloc(sizeof(*buttons->ts_handle), GFP_KERNEL);
   306			if (!buttons->ts_handle) {
   307				mutex_unlock(&buttons->mutex);
   308				return -ENOMEM;
   309			}
   310	
   311			buttons->ts_handle->dev = dev;
   312			buttons->ts_handle->handler = handler;
   313			buttons->ts_handle->name = "touchscreen-buttons";
   314			buttons->ts_handle->private = handler->private;
   315			buttons->queue.lastindex = 0;
   316	
   317			error = input_register_handle(buttons->ts_handle);
   318			if (error) {
   319				dev_err(buttons->dev,
   320					"Failed to register input handler, error %d\n",
   321					error);
   322				kfree(buttons->ts_handle);
   323				buttons->ts_handle = NULL;
   324				mutex_unlock(&buttons->mutex);
   325				return error;
   326			}
   327	
   328			queue_work(buttons->workqueue, &buttons->merge_task);
   329	
   330			if (buttons->filtered_ts_idev->users > 0
   331			    && buttons->ts_handle->open == 0)
   332				queue_work(buttons->workqueue, &buttons->open_task);
   333		}
   334	
   335		mutex_unlock(&buttons->mutex);
   336		return 0;
   337	}
   338	
   339	static void touchscreen_buttons_input_disconnect(struct input_handle *handle)
   340	{
   341		struct touchscreen_buttons *buttons;
   342	
   343		buttons = handle->private;
   344	
   345		mutex_lock(&buttons->mutex);
   346		if (handle == buttons->ts_handle) {
   347			input_close_device(handle);
   348			input_unregister_handle(handle);
   349			kfree(handle);
   350			buttons->ts_handle = NULL;
   351			dev_info(buttons->dev,
   352				 "Touchscreen device disconnected buttons disabled\n");
   353		} else {
   354			dev_err(buttons->dev,
   355				"Unknown device disconnected, %p should be %p", handle,
   356				buttons->ts_handle);
   357		}
   358		mutex_unlock(&buttons->mutex);
   359	}
   360	
   361	static struct touchscreen_button_map
   362	*touchscreen_buttons_get_devtree_pdata(struct device *dev)
   363	{
   364		struct touchscreen_button_map *map;
   365		struct fwnode_handle *child_node;
   366		struct device_node *node;
   367		int i;
   368	
   369		map = kzalloc(sizeof(*map), GFP_KERNEL);
   370		if (!map)
   371			return ERR_PTR(-ENOMEM);
   372	
   373		map->count = device_get_child_node_count(dev);
   374		if (map->count == 0)
   375			return ERR_PTR(-ENODEV);
   376	
   377		map->buttons = kcalloc(map->count, sizeof(*map->buttons), GFP_KERNEL);
   378		if (!map->buttons)
   379			return ERR_PTR(-ENOMEM);
   380	
   381		node = dev->of_node;
   382		map->ts_node = of_parse_phandle(node, "touchscreen_phandle", 0);
   383		if (!map->ts_node) {
   384			dev_err(dev, "touchscreen_phandle node missing\n");
   385			return ERR_PTR(-ENODEV);
   386		}
   387	
   388		dev_info(dev, "Device_node name: %s\n", map->ts_node->name);
   389	
   390		i = 0;
   391		device_for_each_child_node(dev, child_node) {
   392			struct touchscreen_button *button;
   393	
   394			button = &map->buttons[i];
   395	
   396			fwnode_property_read_u32(child_node, "x-position", &button->x);
   397			fwnode_property_read_u32(child_node, "y-position", &button->y);
   398			fwnode_property_read_u32(child_node, "x-size", &button->width);
   399			fwnode_property_read_u32(child_node, "y-size", &button->height);
   400			fwnode_property_read_u32(child_node, "keycode",
   401						 &button->keycode);
   402			dev_info(dev,
   403				 "Adding button at x=%u y=%u size %u x %u keycode=%u\n",
   404				 button->x, button->y, button->width, button->height,
   405				 button->keycode);
   406			++i;
   407		}
   408		return map;
   409	}
   410	
 > 411	int touchscreen_buttons_idev_opened(struct input_dev *idev)
   412	{
   413		struct touchscreen_buttons *buttons;
   414	
   415		buttons = dev_get_drvdata(idev->dev.parent);
   416	
   417		mutex_lock(&buttons->mutex);
   418		if (buttons && buttons->ts_handle) {
   419			if (buttons->ts_handle->open == 0) {
   420				queue_work(buttons->workqueue, &buttons->open_task);
   421				dev_dbg(idev->dev.parent, "idev opened\n");
   422			} else {
   423				dev_info(idev->dev.parent, "idev allready opened\n");
   424			}
   425		} else {
   426			dev_warn(idev->dev.parent,
   427				 "Input device opend but touchscreen not opened. %p %p\n",
   428				 buttons, buttons->ts_handle);
   429		}
   430		mutex_unlock(&buttons->mutex);
   431		return 0;
   432	}
   433	
 > 434	void touchscreen_buttons_idev_closed(struct input_dev *idev)
   435	{
   436		struct touchscreen_buttons *buttons;
   437	
   438		buttons = dev_get_drvdata(idev->dev.parent);
   439	
   440		mutex_lock(&buttons->mutex);
   441		if (buttons && buttons->ts_handle && buttons->ts_handle->open != 0) {
   442			queue_work(buttons->workqueue, &buttons->close_task);
   443			dev_dbg(idev->dev.parent, "idev closed\n");
   444		}
   445		mutex_unlock(&buttons->mutex);
   446	}
   447	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--n8g4imXOkfNTN/H1
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
sa290S3MedEh71j+B4MgIB8hxgEA

--n8g4imXOkfNTN/H1--
