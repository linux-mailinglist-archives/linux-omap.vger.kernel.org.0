Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2413723254
	for <lists+linux-omap@lfdr.de>; Mon,  5 Jun 2023 23:35:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231277AbjFEVfc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 5 Jun 2023 17:35:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230269AbjFEVfb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 5 Jun 2023 17:35:31 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A73FFFA;
        Mon,  5 Jun 2023 14:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686000929; x=1717536929;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Yqsny8Lt/NMjQBOgLc23CN9O63wT5u6FoJM6BqQsSH0=;
  b=C4v879wqQMjNhd874yqUuSCuMGEzdTUmyG/gaTXIOchWRH7toCId04eM
   C03iWYc+lne4L7CY1zfY8W679aDUiKPUnk7dczuCK5pQhOmg/vYygdwbe
   URkVkhSk5hHhUFrU+4MX40uhRu9lLX7geF1uCJcyIAHf0/eUB7dSJvk0M
   +c8E4hJBb1bXm3qCII8s2hUuZMTt4lMwXE7+1hHqeN1Bz8RpVhMVywXaa
   OC4c8Hy/mCazYt2SFdYpLlmIxtuc8YZU9QaV3urdNGIkE8cBCsuNq/fyx
   MSJErCB+8xszfkV0GVg2c1ey0rkmAj+/E8kcrdxlDIx/MgyprM90QT48S
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="442868001"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; 
   d="scan'208";a="442868001"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 14:35:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="798582192"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; 
   d="scan'208";a="798582192"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 05 Jun 2023 14:35:25 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q6HrI-0004SR-1r;
        Mon, 05 Jun 2023 21:35:24 +0000
Date:   Tue, 6 Jun 2023 05:35:22 +0800
From:   kernel test robot <lkp@intel.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
        javierm@redhat.com, sam@ravnborg.org, deller@gmx.de,
        geert+renesas@glider.be, lee@kernel.org,
        daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc:     oe-kbuild-all@lists.linux.dev, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-sh@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-staging@lists.linux.dev,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 28/30] fbdev/core: Move file-I/O code into separate file
Message-ID: <202306060527.syH2D4Is-lkp@intel.com>
References: <20230605144812.15241-29-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230605144812.15241-29-tzimmermann@suse.de>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Thomas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20230605]
[cannot apply to drm-misc/drm-misc-next lee-backlight/for-backlight-next staging/staging-testing staging/staging-next staging/staging-linus linus/master lee-backlight/for-backlight-fixes v6.4-rc5 v6.4-rc4 v6.4-rc3 v6.4-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/backlight-bd6107-Compare-against-struct-fb_info-device/20230605-225002
base:   next-20230605
patch link:    https://lore.kernel.org/r/20230605144812.15241-29-tzimmermann%40suse.de
patch subject: [PATCH 28/30] fbdev/core: Move file-I/O code into separate file
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230606/202306060527.syH2D4Is-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/34fb1357f6464f1173e12cd241310efa5577dd79
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Thomas-Zimmermann/backlight-bd6107-Compare-against-struct-fb_info-device/20230605-225002
        git checkout 34fb1357f6464f1173e12cd241310efa5577dd79
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/video/fbdev/core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306060527.syH2D4Is-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/video/fbdev/core/fb_devfs.c:174:9: error: unknown type name 'compat_caddr_t'
     174 |         compat_caddr_t          smem_start;
         |         ^~~~~~~~~~~~~~
   drivers/video/fbdev/core/fb_devfs.c:183:9: error: unknown type name 'compat_caddr_t'
     183 |         compat_caddr_t          mmio_start;
         |         ^~~~~~~~~~~~~~
   drivers/video/fbdev/core/fb_devfs.c:192:9: error: unknown type name 'compat_caddr_t'
     192 |         compat_caddr_t  red;
         |         ^~~~~~~~~~~~~~
   drivers/video/fbdev/core/fb_devfs.c:193:9: error: unknown type name 'compat_caddr_t'
     193 |         compat_caddr_t  green;
         |         ^~~~~~~~~~~~~~
   drivers/video/fbdev/core/fb_devfs.c:194:9: error: unknown type name 'compat_caddr_t'
     194 |         compat_caddr_t  blue;
         |         ^~~~~~~~~~~~~~
   drivers/video/fbdev/core/fb_devfs.c:195:9: error: unknown type name 'compat_caddr_t'
     195 |         compat_caddr_t  transp;
         |         ^~~~~~~~~~~~~~
   drivers/video/fbdev/core/fb_devfs.c: In function 'fb_getput_cmap':
   drivers/video/fbdev/core/fb_devfs.c:205:37: error: implicit declaration of function 'compat_ptr' [-Werror=implicit-function-declaration]
     205 |         if (copy_from_user(&cmap32, compat_ptr(arg), sizeof(cmap32)))
         |                                     ^~~~~~~~~~
>> drivers/video/fbdev/core/fb_devfs.c:205:37: warning: passing argument 2 of 'copy_from_user' makes pointer from integer without a cast [-Wint-conversion]
     205 |         if (copy_from_user(&cmap32, compat_ptr(arg), sizeof(cmap32)))
         |                                     ^~~~~~~~~~~~~~~
         |                                     |
         |                                     int
   In file included from include/linux/sched/task.h:11,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from include/linux/huge_mm.h:8,
                    from include/linux/mm.h:989,
                    from include/linux/kallsyms.h:13,
                    from include/linux/ftrace.h:13,
                    from include/linux/kprobes.h:28,
                    from include/linux/kgdb.h:19,
                    from include/linux/fb.h:6,
                    from drivers/video/fbdev/core/fb_devfs.c:4:
   include/linux/uaccess.h:180:45: note: expected 'const void *' but argument is of type 'int'
     180 | copy_from_user(void *to, const void __user *from, unsigned long n)
         |                          ~~~~~~~~~~~~~~~~~~~^~~~
>> drivers/video/fbdev/core/fb_devfs.c:211:27: warning: initialization of '__u16 *' {aka 'short unsigned int *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
     211 |                 .red    = compat_ptr(cmap32.red),
         |                           ^~~~~~~~~~
   drivers/video/fbdev/core/fb_devfs.c:211:27: note: (near initialization for '(anonymous).red')
   drivers/video/fbdev/core/fb_devfs.c:212:27: warning: initialization of '__u16 *' {aka 'short unsigned int *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
     212 |                 .green  = compat_ptr(cmap32.green),
         |                           ^~~~~~~~~~
   drivers/video/fbdev/core/fb_devfs.c:212:27: note: (near initialization for '(anonymous).green')
   drivers/video/fbdev/core/fb_devfs.c:213:27: warning: initialization of '__u16 *' {aka 'short unsigned int *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
     213 |                 .blue   = compat_ptr(cmap32.blue),
         |                           ^~~~~~~~~~
   drivers/video/fbdev/core/fb_devfs.c:213:27: note: (near initialization for '(anonymous).blue')
   drivers/video/fbdev/core/fb_devfs.c:214:27: warning: initialization of '__u16 *' {aka 'short unsigned int *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
     214 |                 .transp = compat_ptr(cmap32.transp),
         |                           ^~~~~~~~~~
   drivers/video/fbdev/core/fb_devfs.c:214:27: note: (near initialization for '(anonymous).transp')
   drivers/video/fbdev/core/fb_devfs.c: In function 'fb_get_fscreeninfo':
>> drivers/video/fbdev/core/fb_devfs.c:270:45: warning: passing argument 2 of 'do_fscreeninfo_to_user' makes pointer from integer without a cast [-Wint-conversion]
     270 |         return do_fscreeninfo_to_user(&fix, compat_ptr(arg));
         |                                             ^~~~~~~~~~~~~~~
         |                                             |
         |                                             int
   drivers/video/fbdev/core/fb_devfs.c:228:70: note: expected 'struct fb_fix_screeninfo32 *' but argument is of type 'int'
     228 |                                   struct fb_fix_screeninfo32 __user *fix32)
         |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   cc1: some warnings being treated as errors


vim +/copy_from_user +205 drivers/video/fbdev/core/fb_devfs.c

   197	
   198	static int fb_getput_cmap(struct fb_info *info, unsigned int cmd,
   199				  unsigned long arg)
   200	{
   201		struct fb_cmap32 cmap32;
   202		struct fb_cmap cmap_from;
   203		struct fb_cmap_user cmap;
   204	
 > 205		if (copy_from_user(&cmap32, compat_ptr(arg), sizeof(cmap32)))
   206			return -EFAULT;
   207	
   208		cmap = (struct fb_cmap_user) {
   209			.start	= cmap32.start,
   210			.len	= cmap32.len,
 > 211			.red	= compat_ptr(cmap32.red),
   212			.green	= compat_ptr(cmap32.green),
   213			.blue	= compat_ptr(cmap32.blue),
   214			.transp	= compat_ptr(cmap32.transp),
   215		};
   216	
   217		if (cmd == FBIOPUTCMAP)
   218			return fb_set_user_cmap(&cmap, info);
   219	
   220		lock_fb_info(info);
   221		cmap_from = info->cmap;
   222		unlock_fb_info(info);
   223	
   224		return fb_cmap_to_user(&cmap_from, &cmap);
   225	}
   226	
   227	static int do_fscreeninfo_to_user(struct fb_fix_screeninfo *fix,
   228					  struct fb_fix_screeninfo32 __user *fix32)
   229	{
   230		__u32 data;
   231		int err;
   232	
   233		err = copy_to_user(&fix32->id, &fix->id, sizeof(fix32->id));
   234	
   235		data = (__u32) (unsigned long) fix->smem_start;
   236		err |= put_user(data, &fix32->smem_start);
   237	
   238		err |= put_user(fix->smem_len, &fix32->smem_len);
   239		err |= put_user(fix->type, &fix32->type);
   240		err |= put_user(fix->type_aux, &fix32->type_aux);
   241		err |= put_user(fix->visual, &fix32->visual);
   242		err |= put_user(fix->xpanstep, &fix32->xpanstep);
   243		err |= put_user(fix->ypanstep, &fix32->ypanstep);
   244		err |= put_user(fix->ywrapstep, &fix32->ywrapstep);
   245		err |= put_user(fix->line_length, &fix32->line_length);
   246	
   247		data = (__u32) (unsigned long) fix->mmio_start;
   248		err |= put_user(data, &fix32->mmio_start);
   249	
   250		err |= put_user(fix->mmio_len, &fix32->mmio_len);
   251		err |= put_user(fix->accel, &fix32->accel);
   252		err |= copy_to_user(fix32->reserved, fix->reserved,
   253				    sizeof(fix->reserved));
   254	
   255		if (err)
   256			return -EFAULT;
   257		return 0;
   258	}
   259	
   260	static int fb_get_fscreeninfo(struct fb_info *info, unsigned int cmd,
   261				      unsigned long arg)
   262	{
   263		struct fb_fix_screeninfo fix;
   264	
   265		lock_fb_info(info);
   266		fix = info->fix;
   267		if (info->flags & FBINFO_HIDE_SMEM_START)
   268			fix.smem_start = 0;
   269		unlock_fb_info(info);
 > 270		return do_fscreeninfo_to_user(&fix, compat_ptr(arg));
   271	}
   272	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
