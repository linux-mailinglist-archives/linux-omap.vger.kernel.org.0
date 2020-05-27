Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D0771E5164
	for <lists+linux-omap@lfdr.de>; Thu, 28 May 2020 00:41:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725821AbgE0WlN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 27 May 2020 18:41:13 -0400
Received: from muru.com ([72.249.23.125]:55922 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725613AbgE0WlM (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 27 May 2020 18:41:12 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 8B7EA80DB;
        Wed, 27 May 2020 22:42:01 +0000 (UTC)
Date:   Wed, 27 May 2020 15:41:08 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-omap@vger.kernel.org
Subject: Re: pinctrl-single: num_maps in generic pinconf support?
Message-ID: <20200527224108.GM37466@atomide.com>
References: <20200526122133.GA1454440@x1>
 <20200527165122.GL37466@atomide.com>
 <20200527221915.GA2963339@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200527221915.GA2963339@x1>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Drew Fustini <drew@beagleboard.org> [200527 22:20]:
> On Wed, May 27, 2020 at 09:51:22AM -0700, Tony Lindgren wrote:
> > * Drew Fustini <drew@beagleboard.org> [200526 12:22]:
> > > Hello Haojian and Linus,
> > > 
> > > For pcs_parse_one_pinctrl_entry() in drivers/pinctrl/pinctrl-single.c,
> > > I see that num_maps is set to 2 if PCS_HAS_PINCONF is enabled:
> > > 
> > > 1057         if (PCS_HAS_PINCONF && function) {
> > > 1058                 res = pcs_parse_pinconf(pcs, np, function, map);
> > > 1059                 if (res)
> > > 1060                         goto free_pingroups;
> > > 1061                 *num_maps = 2;
> > > 1062         } else {
> > > 1063                 *num_maps = 1;
> > > 1064         }
> > > 1065         mutex_unlock(&pcs->mutex);
> > > 
> > > git blame shows me that came from 9dddb4df90d13:
> > > "pinctrl: single: support generic pinconf"
> > > 
> > > Would you be able to provide any insight as to num_maps needs to be 2
> > > when pinconf is enabled?
> > 
> > Only slightly related, but we should really eventually move omaps to use
> > #pinctrl-cells = <2> (or 3) instead of 1, and pass the pinconf seprately
> > from the mux mode. 
> 
> Thanks for the insight, Tony.
> 
> I was not considering the situation where pinctrl-cells would be more
> than 1.
> 
> I see now from pinctrl-single.txt bindings doc that:
> 
> - #pinctrl-cells : number of cells in addition to the index, set to 1
>   for pinctrl-single,pins and 2 for pinctrl-single,bits
> 
> I am now wondering if it wrong for me to expect compatible string of 
> "pinconf-single" to work with pinctrl-cells of 1.

Ideally the #pinctrl-cells would be what makes sense for the
hardware. However, I'm guessing pinctrl-single.c needs patching
for that to happen.

> I see that arch/arm/boot/dts/da850.dtsi has:
> 
> 154                 pmx_core: pinmux@14120 {
> 155                         compatible = "pinctrl-single";
> 156                         reg = <0x14120 0x50>;
> 157                         #pinctrl-cells = <2>;
> 158                         pinctrl-single,bit-per-mux;
> 
> and arch/arm/boot/dts/keystone-k2l.dtsi has:
> 
> 108                 k2l_pmx: pinmux@2620690 {
> 109                         compatible = "pinctrl-single";
> 110                         reg = <0x02620690 0xc>;
> 111                         #address-cells = <1>;
> 112                         #size-cells = <0>;
> 113                         #pinctrl-cells = <2>;
> 114                         pinctrl-single,bit-per-mux;

Yeah so there's also the "bit-per-mux" variant. That should not
affect #pinctrl-cells use, we just need to make it more flexible.

> > We already treat them separately with the new
> > AM33XX_PADCONF macro, so we'd only have to change one SoC at a time to
> > use updated #pinctrl-cells. But I think pinctrl-single might need some
> > changes before we can do that.
> 
> Do you mean that it would be possible to make the change just for AM335x
> to start with?

Yes. So ideally we'd just fix up whatever is needed in pinctrl-single.c,
then just set #pinctrl-cells = <2> in am33xx-l4.dtsi, and update the
AM33XX_PADCONF accordingly.

> Do you think the changes would be limited to pinctrl-single.c and the
> associated device tree files like am33xx-l4.dtsi ?

Yes that should be the case. There should be no need to churn the board
specific dts files now that we have AM33XX_PADCONF.

Regards,

Tony
