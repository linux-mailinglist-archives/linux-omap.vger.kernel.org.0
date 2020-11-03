Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB55C2A454A
	for <lists+linux-omap@lfdr.de>; Tue,  3 Nov 2020 13:34:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728241AbgKCMec (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 3 Nov 2020 07:34:32 -0500
Received: from mga17.intel.com ([192.55.52.151]:22163 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728210AbgKCMec (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 3 Nov 2020 07:34:32 -0500
IronPort-SDR: PUHf1Ip/tJrOXeKKYQO4KQkGINmEN+0RBXsEgFwjbVJTyN3M+A1/PLb/zcr4hio4o+xkH/XGih
 5izhAXyBWSgA==
X-IronPort-AV: E=McAfee;i="6000,8403,9793"; a="148897892"
X-IronPort-AV: E=Sophos;i="5.77,447,1596524400"; 
   d="gz'50?scan'50,208,50";a="148897892"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2020 04:34:30 -0800
IronPort-SDR: xylsquXsFV0uiSaa1zzFaqE9c+J+rwQVKB1xYGQzqnC9oiASgeEkJS7LN7kyiazmkoRoGiTXkG
 YsFK7Mh2nOPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,447,1596524400"; 
   d="gz'50?scan'50,208,50";a="538476783"
Received: from lkp-server02.sh.intel.com (HELO e61783667810) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 03 Nov 2020 04:34:27 -0800
Received: from kbuild by e61783667810 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kZvW6-0000Es-UF; Tue, 03 Nov 2020 12:34:26 +0000
Date:   Tue, 3 Nov 2020 20:34:15 +0800
From:   kernel test robot <lkp@intel.com>
To:     Carl Philipp Klemm <philipp@uvos.xyz>, tony@atomide.com
Cc:     kbuild-all@lists.01.org, linux-omap@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v2] Drivers: input: misc: Add driver touchscreen-buttons
 to support physically labeled buttons on touch screen surfaces
Message-ID: <202011032015.sTpusG82-lkp@intel.com>
References: <20201029180448.e3aadaf2422d58470a9d0fcc@uvos.xyz>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="VbJkn9YxBvnuCH5J"
Content-Disposition: inline
In-Reply-To: <20201029180448.e3aadaf2422d58470a9d0fcc@uvos.xyz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Carl,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on input/next]
[also build test WARNING on v5.10-rc2 next-20201103]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Carl-Philipp-Klemm/Drivers-input-misc-Add-driver-touchscreen-buttons-to-support-physically-labeled-buttons-on-touch-screen-surfaces/20201030-010622
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
config: x86_64-randconfig-m001-20201103 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

smatch warnings:
drivers/input/misc/touchscreen-buttons.c:179 touchscreen_buttons_input_event() warn: always true condition '(buttons->queue.lastindex >= 0) => (0-u32max >= 0)'
drivers/input/misc/touchscreen-buttons.c:348 touchscreen_buttons_get_devtree_pdata() warn: possible memory leak of 'map'
drivers/input/misc/touchscreen-buttons.c:397 touchscreen_buttons_idev_opened() error: we previously assumed 'buttons' could be null (see line 389)

vim +179 drivers/input/misc/touchscreen-buttons.c

   166	
   167	static void touchscreen_buttons_input_event(struct input_handle *handle,
   168						    unsigned int type, unsigned int code, int value)
   169	{
   170		struct touchscreen_buttons *buttons;
   171	
   172		buttons = handle->private;
   173	
   174		if (type == EV_SYN && code == SYN_REPORT) {
   175			if (touchscreen_buttons_process_syn(&buttons->queue,
   176				buttons->map, buttons->buttons_idev) == 0)
   177				touchscreen_buttons_resend_events(&buttons->queue, buttons->filtered_ts_idev);
   178			buttons->queue.lastindex = 0;
 > 179		} else if (buttons->queue.lastindex < EVENT_QUEUE_SIZE && buttons->queue.lastindex >= 0) {
   180			buttons->queue.events[buttons->queue.lastindex].type = type;
   181			buttons->queue.events[buttons->queue.lastindex].code = code;
   182			buttons->queue.events[buttons->queue.lastindex].value = value;
   183			++buttons->queue.lastindex;
   184		} else {
   185			dev_warn(buttons->dev,
   186				 "event_qeue overrun, will not capture events until next SYN_REPORT\n");
   187		}
   188	}
   189	
   190	static void touchscreen_buttons_merge_capabilitys(struct input_dev *target, struct input_dev *source)
   191	{
   192		unsigned int i;
   193	
   194		mutex_lock(&target->mutex);
   195		mutex_lock(&source->mutex);
   196		for (i = 0; i < BITS_TO_LONGS(INPUT_PROP_CNT); ++i)
   197			target->propbit[i] = target->propbit[i] | source->propbit[i];
   198		for (i = 0; i < BITS_TO_LONGS(EV_CNT); ++i)
   199			target->evbit[i] = target->evbit[i] | source->evbit[i];
   200		for (i = 0; i < BITS_TO_LONGS(KEY_CNT); ++i)
   201			target->keybit[i] = target->keybit[i] | source->keybit[i];
   202		for (i = 0; i < BITS_TO_LONGS(REL_CNT); ++i)
   203			target->relbit[i] = target->relbit[i] | source->relbit[i];
   204		for (i = 0; i < BITS_TO_LONGS(ABS_CNT); ++i)
   205			target->absbit[i] = target->absbit[i] | source->absbit[i];
   206		for (i = 0; i < BITS_TO_LONGS(MSC_CNT); ++i)
   207			target->mscbit[i] = target->mscbit[i] | source->mscbit[i];
   208		for (i = 0; i < BITS_TO_LONGS(LED_CNT); ++i)
   209			target->ledbit[i] = target->ledbit[i] | source->ledbit[i];
   210		for (i = 0; i < BITS_TO_LONGS(SND_CNT); ++i)
   211			target->sndbit[i] = target->sndbit[i] | source->sndbit[i];
   212		for (i = 0; i < BITS_TO_LONGS(FF_CNT); ++i)
   213			target->ffbit[i] = target->ffbit[i] | source->ffbit[i];
   214		for (i = 0; i < BITS_TO_LONGS(SW_CNT); ++i)
   215			target->swbit[i] = target->swbit[i] | source->swbit[i];
   216	
   217		if (*source->evbit & (1 << EV_ABS)) {
   218			input_alloc_absinfo(target);
   219			for (i = 0; i < ABS_CNT; ++i)
   220				target->absinfo[i] = source->absinfo[i];
   221			if (source->mt) {
   222				input_mt_init_slots(target, source->mt->num_slots, source->mt->flags);
   223				touchscreen_buttons_copy_mt_slots(target, source);
   224			}
   225		}
   226		mutex_unlock(&source->mutex);
   227		mutex_unlock(&target->mutex);
   228	}
   229	
   230	void merge_task_handler(struct work_struct *work)
   231	{
   232		struct touchscreen_buttons *buttons = container_of(work, struct touchscreen_buttons, merge_task);
   233	
   234		mutex_lock(&buttons->mutex);
   235		if (buttons->ts_handle && buttons->ts_handle->dev)
   236			touchscreen_buttons_merge_capabilitys(buttons->filtered_ts_idev, buttons->ts_handle->dev);
   237		mutex_unlock(&buttons->mutex);
   238	}
   239	
   240	void close_task_handler(struct work_struct *work)
   241	{
   242		struct touchscreen_buttons *buttons = container_of(work, struct touchscreen_buttons, close_task);
   243	
   244		mutex_lock(&buttons->mutex);
   245		if (buttons && buttons->ts_handle && buttons->ts_handle->open != 0)
   246			input_close_device(buttons->ts_handle);
   247		mutex_unlock(&buttons->mutex);
   248	}
   249	
   250	void open_task_handler(struct work_struct *work)
   251	{
   252		struct touchscreen_buttons *buttons = container_of(work, struct touchscreen_buttons, open_task);
   253		int error;
   254	
   255		mutex_lock(&buttons->mutex);
   256		if (buttons && buttons->ts_handle) {
   257			error = input_open_device(buttons->ts_handle);
   258			if (error) {
   259				dev_err(buttons->dev, "Failed to open input device, error %d\n", error);
   260				input_unregister_handle(buttons->ts_handle);
   261				kfree(buttons->ts_handle);
   262				buttons->ts_handle = NULL;
   263			}
   264		}
   265		mutex_unlock(&buttons->mutex);
   266	}
   267	
   268	static int touchscreen_buttons_input_connect(struct input_handler *handler,
   269						     struct input_dev *dev, const struct input_device_id *id)
   270	{
   271		struct touchscreen_buttons *buttons;
   272	
   273		buttons = handler->private;
   274	
   275		mutex_lock(&buttons->mutex);
   276	
   277		if ((!buttons->ts_handle && device_match_of_node(&dev->dev, buttons->map->ts_node)) ||
   278			(dev->dev.parent && device_match_of_node(dev->dev.parent, buttons->map->ts_node))) {
   279			int error;
   280	
   281			dev_info(buttons->dev, "Binding to device: %s\n", dev_name(&dev->dev));
   282	
   283			buttons->ts_handle = kzalloc(sizeof(*buttons->ts_handle), GFP_KERNEL);
   284			if (!buttons->ts_handle) {
   285				mutex_unlock(&buttons->mutex);
   286				return -ENOMEM;
   287			}
   288	
   289			buttons->ts_handle->dev = dev;
   290			buttons->ts_handle->handler = handler;
   291			buttons->ts_handle->name = "touchscreen-buttons";
   292			buttons->ts_handle->private = handler->private;
   293			buttons->queue.lastindex = 0;
   294	
   295			error = input_register_handle(buttons->ts_handle);
   296			if (error) {
   297				dev_err(buttons->dev, "Failed to register input handler, error %d\n", error);
   298				kfree(buttons->ts_handle);
   299				buttons->ts_handle = NULL;
   300				mutex_unlock(&buttons->mutex);
   301				return error;
   302			}
   303	
   304			queue_work(buttons->workqueue, &buttons->merge_task);
   305	
   306			if (buttons->filtered_ts_idev->users > 0 && buttons->ts_handle->open == 0)
   307				queue_work(buttons->workqueue, &buttons->open_task);
   308		}
   309	
   310		mutex_unlock(&buttons->mutex);
   311		return 0;
   312	}
   313	
   314	static void touchscreen_buttons_input_disconnect(struct input_handle *handle)
   315	{
   316		struct touchscreen_buttons *buttons;
   317	
   318		buttons = handle->private;
   319	
   320		mutex_lock(&buttons->mutex);
   321		if (handle == buttons->ts_handle) {
   322			input_close_device(handle);
   323			input_unregister_handle(handle);
   324			kfree(handle);
   325			buttons->ts_handle = NULL;
   326			dev_info(buttons->dev, "Touchscreen device disconnected buttons disabled\n");
   327		} else {
   328			dev_err(buttons->dev, "Unknown device disconnected, %p should be %p", handle,
   329				buttons->ts_handle);
   330		}
   331		mutex_unlock(&buttons->mutex);
   332	}
   333	
   334	static struct touchscreen_button_map
   335	*touchscreen_buttons_get_devtree_pdata(struct device *dev)
   336	{
   337		struct touchscreen_button_map *map;
   338		struct fwnode_handle *child_node;
   339		struct device_node *node;
   340		int i;
   341	
   342		map = kzalloc(sizeof(*map), GFP_KERNEL);
   343		if (!map)
   344			return ERR_PTR(-ENOMEM);
   345	
   346		map->count = device_get_child_node_count(dev);
   347		if (map->count == 0)
 > 348			return ERR_PTR(-ENODEV);
   349	
   350		map->buttons = kcalloc(map->count, sizeof(*map->buttons), GFP_KERNEL);
   351		if (!map->buttons)
   352			return ERR_PTR(-ENOMEM);
   353	
   354		node = dev->of_node;
   355		map->ts_node = of_parse_phandle(node, "touchscreen_phandle", 0);
   356		if (!map->ts_node) {
   357			dev_err(dev, "touchscreen_phandle node missing\n");
   358			return ERR_PTR(-ENODEV);
   359		}
   360	
   361		dev_info(dev, "Device_node name: %s\n", map->ts_node->name);
   362	
   363		i = 0;
   364		device_for_each_child_node(dev, child_node) {
   365			struct touchscreen_button *button;
   366	
   367			button = &map->buttons[i];
   368	
   369			fwnode_property_read_u32(child_node, "x-position", &button->x);
   370			fwnode_property_read_u32(child_node, "y-position", &button->y);
   371			fwnode_property_read_u32(child_node, "x-size", &button->width);
   372			fwnode_property_read_u32(child_node, "y-size", &button->height);
   373			fwnode_property_read_u32(child_node, "keycode", &button->keycode);
   374			dev_info(dev,
   375				 "Adding button at x=%u y=%u size %u x %u keycode=%u\n",
   376				 button->x, button->y, button->width, button->height, button->keycode);
   377			++i;
   378		}
   379		return map;
   380	}
   381	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--VbJkn9YxBvnuCH5J
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--VbJkn9YxBvnuCH5J--
