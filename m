Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FBE0210DF5
	for <lists+linux-omap@lfdr.de>; Wed,  1 Jul 2020 16:44:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730941AbgGAOoT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 1 Jul 2020 10:44:19 -0400
Received: from muru.com ([72.249.23.125]:60176 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726251AbgGAOoT (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 1 Jul 2020 10:44:19 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id C10DD8063;
        Wed,  1 Jul 2020 14:45:10 +0000 (UTC)
Date:   Wed, 1 Jul 2020 07:44:15 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Rong Chen <rong.a.chen@intel.com>
Cc:     kernel test robot <lkp@intel.com>, Adam Ford <aford173@gmail.com>,
        linux-omap@vger.kernel.org, kbuild-all@lists.01.org,
        aford@beaconembedded.com,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Walmsley <paul@pwsan.com>,
        Russell King <linux@armlinux.org.uk>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [kbuild-all] Re: [PATCH] ARM: dts: omap3: Migrate AES from
 hwmods to sysc-omap2
Message-ID: <20200701144415.GH37466@atomide.com>
References: <20200617105840.22138-1-aford173@gmail.com>
 <202006180107.6NIzI00f%lkp@intel.com>
 <20200629181250.GY37466@atomide.com>
 <c30dd2e4-0f80-9caf-0cfa-45a60a2d1319@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c30dd2e4-0f80-9caf-0cfa-45a60a2d1319@intel.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Rong Chen <rong.a.chen@intel.com> [200630 00:31]:
> 
> 
> On 6/30/20 2:12 AM, Tony Lindgren wrote:
> > * kernel test robot <lkp@intel.com> [200617 17:28]:
> > > Hi Adam,
> > > 
> > > Thank you for the patch! Yet something to improve:
> > > 
> > > [auto build test ERROR on omap/for-next]
> > > [cannot apply to balbi-usb/testing/next]
> > > [if your patch is applied to the wrong git tree, please drop us a note to help
> > > improve the system. BTW, we also suggest to use '--base' option to specify the
> > > base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
> > This applies to v5.8-rc1, so the error above can be ignored now.
> > 
> > Applying patch into omap-for-v5.9/ti-sysc-drop-pdata.
> 
> Hi Tony,
> 
> Thanks for the feedback, we'll fix the wrong base.

OK thanks. Not sure what you use to determine the base, but in
general current Linux mainline master or for-next should work
as the base.

Regards,

Tony
