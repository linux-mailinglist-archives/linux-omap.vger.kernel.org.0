Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACC2511D1AD
	for <lists+linux-omap@lfdr.de>; Thu, 12 Dec 2019 17:01:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729660AbfLLQBq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Dec 2019 11:01:46 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:45358 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729247AbfLLQBq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 12 Dec 2019 11:01:46 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBCG1ZEu043856;
        Thu, 12 Dec 2019 10:01:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576166495;
        bh=OnhHmDj6730v80P+aisX1kJAhLR/dwQTQne0SU1G23E=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=B95YTL+OcMwcNnUgM+uKJjuP9L/cxfMLW53TGUda3pFDkcbFwT5guS9F9lS+eRbHq
         +PAGWDdzKgwCO9lCB6z+joc0RlkF1LfeTlJGwew6ujdomis4U2opVzshX0A+Lz/c6Q
         hbFJ4wCjM11OorxtQyYLyS2am3yQV4na+KKcc92Y=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBCG1Z58086793
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 12 Dec 2019 10:01:35 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 12
 Dec 2019 10:01:35 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 12 Dec 2019 10:01:35 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBCG1ZsD023629;
        Thu, 12 Dec 2019 10:01:35 -0600
Date:   Thu, 12 Dec 2019 10:00:59 -0600
From:   Bin Liu <b-liu@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH] usb: musb: fix idling for suspend after disconnect
 interrupt
Message-ID: <20191212160059.GI16429@iaqt7>
Mail-Followup-To: Bin Liu <b-liu@ti.com>, Tony Lindgren <tony@atomide.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        Merlijn Wajer <merlijn@wizzup.org>, Pavel Machek <pavel@ucw.cz>,
        Sebastian Reichel <sre@kernel.org>
References: <20191126034151.38154-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191126034151.38154-1-tony@atomide.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

Sorry for my late response.

On Mon, Nov 25, 2019 at 07:41:51PM -0800, Tony Lindgren wrote:
> When disconnected as USB B-device, we sometimes get a suspend interrupt
> after disconnect interrupt. In that case we have devctl set to 99 with
> VBUS still valid and musb_pm_runtime_check_session() wrongly things we
> have an active session. We have no other interrupts after disconnect
> coming in this case at least with the omap2430 glue.

I don't have an omap2430 platform to test, but its musb doesn't generate
DISCONNECT interrupt at all when disconnected from USB host in any case?
It is a surprise, the musb core driver expects the DISCONNECT interrupt
after VBUS is lost and relies on it to tear down the gadget driver and
the state machine. I am wondering how its USB is functional without the
DISCONNECT event...

-Bin.

> 
> Let's fix the issue by checking the interrupt status again with
> delayed work for the devctl 99 case. In the suspend after disconnect
> case the devctl session bit has cleared by then and musb can idle.
> For a typical USB B-device connect case we just continue with normal
> interrupts.
> 
> Cc: Merlijn Wajer <merlijn@wizzup.org>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Sebastian Reichel <sre@kernel.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  drivers/usb/musb/musb_core.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
> --- a/drivers/usb/musb/musb_core.c
> +++ b/drivers/usb/musb/musb_core.c
> @@ -1943,6 +1943,9 @@ ATTRIBUTE_GROUPS(musb);
>  #define MUSB_QUIRK_B_INVALID_VBUS_91	(MUSB_DEVCTL_BDEVICE | \
>  					 (2 << MUSB_DEVCTL_VBUS_SHIFT) | \
>  					 MUSB_DEVCTL_SESSION)
> +#define MUSB_QUIRK_B_DISCONNECT_99	(MUSB_DEVCTL_BDEVICE | \
> +					 (3 << MUSB_DEVCTL_VBUS_SHIFT) | \
> +					 MUSB_DEVCTL_SESSION)
>  #define MUSB_QUIRK_A_DISCONNECT_19	((3 << MUSB_DEVCTL_VBUS_SHIFT) | \
>  					 MUSB_DEVCTL_SESSION)
>  
> @@ -1965,6 +1968,11 @@ static void musb_pm_runtime_check_session(struct musb *musb)
>  	s = MUSB_DEVCTL_FSDEV | MUSB_DEVCTL_LSDEV |
>  		MUSB_DEVCTL_HR;
>  	switch (devctl & ~s) {
> +	case MUSB_QUIRK_B_DISCONNECT_99:
> +		musb_dbg(musb, "Poll devctl in case of suspend after disconnect\n");
> +		schedule_delayed_work(&musb->irq_work,
> +				      msecs_to_jiffies(1000));
> +		break;
>  	case MUSB_QUIRK_B_INVALID_VBUS_91:
>  		if (musb->quirk_retries && !musb->flush_irq_work) {
>  			musb_dbg(musb,
> -- 
> 2.24.0
