Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7916F1D7C21
	for <lists+linux-omap@lfdr.de>; Mon, 18 May 2020 17:00:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728055AbgERPAm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 18 May 2020 11:00:42 -0400
Received: from mga01.intel.com ([192.55.52.88]:6466 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726958AbgERPAm (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 18 May 2020 11:00:42 -0400
IronPort-SDR: gETPJuecheRBTFX7C/6OQSC1Mm01cQXiAXGTuxy1Vt9SN4saYjmvijRGMiVaji4T0zTu7vVZnO
 jsDBJTM2I0aw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2020 08:00:33 -0700
IronPort-SDR: EdpOmiPmdb8bUA7ozCaf7HQjA8VwSaNauqhI8mn5jk2F7S+yjuFVh//4jhims+nT5xZn9LyuAh
 PG/kI/sIQ6dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,407,1583222400"; 
   d="scan'208";a="288602066"
Received: from pl-dbox.sh.intel.com (HELO intel.com) ([10.239.159.39])
  by fmsmga004.fm.intel.com with ESMTP; 18 May 2020 08:00:31 -0700
Date:   Mon, 18 May 2020 22:59:11 +0800
From:   Philip Li <philip.li@intel.com>
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     kbuild test robot <lkp@intel.com>, kbuild-all@lists.01.org,
        USB list <linux-usb@vger.kernel.org>,
        linux-omap@vger.kernel.org, Felipe Balbi <balbi@kernel.org>
Subject: Re: [kbuild-all] Re: [balbi-usb:testing/fixes 2/8] WARNING:
 simple_strtoul is obsolete, use kstrtoul instead
Message-ID: <20200518145911.GA14746@intel.com>
References: <20200518033319.GC24805@intel.com>
 <CAAeHK+wLp6h9Ew5ZHgk7u3qQ7gN32ZPqdWUcYcFNYfzFw5EvVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAeHK+wLp6h9Ew5ZHgk7u3qQ7gN32ZPqdWUcYcFNYfzFw5EvVQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, May 18, 2020 at 04:16:25PM +0200, Andrey Konovalov wrote:
> On Mon, May 18, 2020 at 5:34 AM kbuild test robot <lkp@intel.com> wrote:
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git testing/fixes
> > head:   172b14b48ca10b280482b164506892ea09edb946
> > commit: 97df5e5758f7d1dd0ca97e3210696818fc45bdb3 [2/8] usb: raw-gadget: fix gadget endpoint selection
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kbuild test robot <lkp@intel.com>
> >
> > scripts/checkpatch.pl 0001-usb-raw-gadget-fix-gadget-endpoint-selection.patch
> > # many are suggestions rather than must-fix
> >
> > WARNING: simple_strtoul is obsolete, use kstrtoul instead
> > #123: drivers/usb/gadget/legacy/raw_gadget.c:261:
> > +               return simple_strtoul(&name[2], NULL, 10);
> 
> The use of simple_strtoul() is intended here and falls under [1]. I'm
> not sure if we need to explain this to kbuild test robot somehow.
thanks for the info, we will be careful for this WARNING in future. Sorry
for the wrong report.

> 
> [1] https://elixir.bootlin.com/linux/v5.7-rc5/source/include/linux/kernel.h#L459
> _______________________________________________
> kbuild-all mailing list -- kbuild-all@lists.01.org
> To unsubscribe send an email to kbuild-all-leave@lists.01.org
