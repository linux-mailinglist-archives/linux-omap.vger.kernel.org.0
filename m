Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4E39122FAB
	for <lists+linux-omap@lfdr.de>; Tue, 17 Dec 2019 16:07:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727224AbfLQPHf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 17 Dec 2019 10:07:35 -0500
Received: from muru.com ([72.249.23.125]:48918 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726925AbfLQPHf (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 17 Dec 2019 10:07:35 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id DF34D8116;
        Tue, 17 Dec 2019 15:08:14 +0000 (UTC)
Date:   Tue, 17 Dec 2019 07:07:32 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     "Andrew F. Davis" <afd@ti.com>
Cc:     Mark Rutland <mark.rutland@arm.com>, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: OMAP: Use ARM SMC Calling Convention when OP-TEE is
 available
Message-ID: <20191217150732.GW35479@atomide.com>
References: <7fa11037-8d33-2274-c8cc-80e9630b38b0@ti.com>
 <20191119192029.GP35479@atomide.com>
 <0ad31b32-712e-5bef-5645-0336dfec99cc@ti.com>
 <20191119194425.GQ35479@atomide.com>
 <f2f53e5e-6c95-e32f-d67a-284bb88e73e0@ti.com>
 <1ff8ae4b-5de3-4fdf-7318-d33398dc7fc8@ti.com>
 <20191216210407.GR35479@atomide.com>
 <9adad579-98b4-f228-caf3-f4996dcaecda@ti.com>
 <20191216224105.GS35479@atomide.com>
 <35e4b682-0d2f-23b1-6df4-428c6bcb4d59@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35e4b682-0d2f-23b1-6df4-428c6bcb4d59@ti.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Andrew F. Davis <afd@ti.com> [191217 13:14]:
> On 12/16/19 5:41 PM, Tony Lindgren wrote:
> > Please just add omap_early_initcall() to omap-secure.c while at it
> > to deal with this.
>
> omap_early_initcall()s are not called until after all the SMC calls have
> already happened.

Oh OK. Then let's just add omap_secure_init() that's called from
*_init_early() as late as possible. We will have more use for that
init later on too.

Regards,

Tony
