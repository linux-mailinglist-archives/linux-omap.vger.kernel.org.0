Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5319987171
	for <lists+linux-omap@lfdr.de>; Fri,  9 Aug 2019 07:27:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405395AbfHIF1z (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 9 Aug 2019 01:27:55 -0400
Received: from mga04.intel.com ([192.55.52.120]:12546 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405388AbfHIF1z (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 9 Aug 2019 01:27:55 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Aug 2019 22:27:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,364,1559545200"; 
   d="scan'208";a="177537261"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by orsmga003.jf.intel.com with ESMTP; 08 Aug 2019 22:27:52 -0700
From:   Felipe Balbi <felipe.balbi@linux.intel.com>
To:     kbuild test robot <lkp@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     kbuild-all@01.org, linux-usb@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: Re: [balbi-usb:testing/next 2/13] drivers/usb/phy/phy-tahvo.c:434:4: error: 'struct device_driver' has no member named 'dev_groups'; did you mean 'groups'?
In-Reply-To: <201908082335.aajJntgU%lkp@intel.com>
References: <201908082335.aajJntgU%lkp@intel.com>
Date:   Fri, 09 Aug 2019 08:27:52 +0300
Message-ID: <875zn6gb6v.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


Hi,

kbuild test robot <lkp@intel.com> writes:

> tree:   https://kernel.googlesource.com/pub/scm/linux/kernel/git/balbi/usb.git testing/next
> head:   d06a2c3f683a591efce9d02b2b60ef346df5ae02
> commit: 2a714ea6d90d9d1b510ba424652a2e3dfd547267 [2/13] USB: phy: tahvo: convert platform driver to use dev_groups
> config: sh-allmodconfig (attached as .config)
> compiler: sh4-linux-gcc (GCC) 7.4.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 2a714ea6d90d9d1b510ba424652a2e3dfd547267
>         # save the attached .config to linux build tree
>         GCC_VERSION=7.4.0 make.cross ARCH=sh 
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>>> drivers/usb/phy/phy-tahvo.c:434:4: error: 'struct device_driver' has no member named 'dev_groups'; did you mean 'groups'?
>       .dev_groups = tahvo_groups,
>        ^~~~~~~~~~


looks like these patches depend on something else that's not upstream
yet. I'll drop the patches from my queue. Greg,if you'd like to add my
ack:

Acked-by: Felipe Balbi <felipe.balbi@linux.intel.com>

cheers

-- 
balbi
