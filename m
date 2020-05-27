Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EADC1E4AFE
	for <lists+linux-omap@lfdr.de>; Wed, 27 May 2020 18:51:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728177AbgE0Qv1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 27 May 2020 12:51:27 -0400
Received: from muru.com ([72.249.23.125]:55894 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726529AbgE0Qv1 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 27 May 2020 12:51:27 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 0D56D80DB;
        Wed, 27 May 2020 16:52:16 +0000 (UTC)
Date:   Wed, 27 May 2020 09:51:22 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-omap@vger.kernel.org
Subject: Re: pinctrl-single: num_maps in generic pinconf support?
Message-ID: <20200527165122.GL37466@atomide.com>
References: <20200526122133.GA1454440@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200526122133.GA1454440@x1>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Drew Fustini <drew@beagleboard.org> [200526 12:22]:
> Hello Haojian and Linus,
> 
> For pcs_parse_one_pinctrl_entry() in drivers/pinctrl/pinctrl-single.c,
> I see that num_maps is set to 2 if PCS_HAS_PINCONF is enabled:
> 
> 1057         if (PCS_HAS_PINCONF && function) {
> 1058                 res = pcs_parse_pinconf(pcs, np, function, map);
> 1059                 if (res)
> 1060                         goto free_pingroups;
> 1061                 *num_maps = 2;
> 1062         } else {
> 1063                 *num_maps = 1;
> 1064         }
> 1065         mutex_unlock(&pcs->mutex);
> 
> git blame shows me that came from 9dddb4df90d13:
> "pinctrl: single: support generic pinconf"
> 
> Would you be able to provide any insight as to num_maps needs to be 2
> when pinconf is enabled?

Only slightly related, but we should really eventually move omaps to use
#pinctrl-cells = <2> (or 3) instead of 1, and pass the pinconf seprately
from the mux mode. We already treat them separately with the new
AM33XX_PADCONF macro, so we'd only have to change one SoC at a time to
use updated #pinctrl-cells. But I think pinctrl-single might need some
changes before we can do that.

Regards,

Tony
