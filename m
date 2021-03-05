Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F1AB32E331
	for <lists+linux-omap@lfdr.de>; Fri,  5 Mar 2021 08:50:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229446AbhCEHuD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 5 Mar 2021 02:50:03 -0500
Received: from muru.com ([72.249.23.125]:39694 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229458AbhCEHuD (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 5 Mar 2021 02:50:03 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id B3D1C80BA;
        Fri,  5 Mar 2021 07:50:40 +0000 (UTC)
Date:   Fri, 5 Mar 2021 09:49:54 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Keerthy <j-keerthy@ti.com>, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] clocksource/drivers/timer-ti-dm: Remove extra
 of_node_put()
Message-ID: <YEHiojjAj4YLWGxA@atomide.com>
References: <20210304072135.52712-1-tony@atomide.com>
 <20210304072135.52712-3-tony@atomide.com>
 <4c23ce3e-3304-b10d-5054-f421822b5dc2@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c23ce3e-3304-b10d-5054-f421822b5dc2@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Grygorii Strashko <grygorii.strashko@ti.com> [210304 20:56]:
> 
> 
> On 04/03/2021 09:21, Tony Lindgren wrote:
> > We have of_translate_address() already do of_node_put() as needed.
> > I probably looked at __of_translate_address() earlier by accident
> > that of_translate_address() uses.
> 
> I do not see of_node_put() in of_translate_address() and
>  __of_translate_address() is doing of_node_get(dev);
> ?

Oh right.. this is confusing.. Yeah we can ignore this patch.
We should have the use count set for only the system timer(s)
we claim.

Regards,

Tony
