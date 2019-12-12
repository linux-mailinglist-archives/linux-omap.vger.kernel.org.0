Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E7FB11D331
	for <lists+linux-omap@lfdr.de>; Thu, 12 Dec 2019 18:09:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729993AbfLLRJN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Dec 2019 12:09:13 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:53530 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729804AbfLLRJN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 12 Dec 2019 12:09:13 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBCH951o066318;
        Thu, 12 Dec 2019 11:09:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576170545;
        bh=ZfQ53PNcEHYZNdrNFmm1s8ONDRLhV0Hn9oYml18BYAU=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=MOohh74CsEdRJf/e4oT4lBCOaAQ9kIThd1jcfAFlH08MiePtuKzfvbLY+bYKhqzI2
         +vdsOibywoNHbHEaC/aLSeX7c9l/wXVI3rasl4cvTA7t6g2b+fgSlr7evFOIKrqHQS
         2hIDqifRucQS8zYWPks/lMBp9/I5oZMGCflwVzm0=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBCH95lM105566;
        Thu, 12 Dec 2019 11:09:05 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 12
 Dec 2019 11:09:05 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 12 Dec 2019 11:09:05 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBCH95AF033849;
        Thu, 12 Dec 2019 11:09:05 -0600
Date:   Thu, 12 Dec 2019 11:08:29 -0600
From:   Bin Liu <b-liu@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH] usb: musb: fix idling for suspend after disconnect
 interrupt
Message-ID: <20191212170829.GA14499@iaqt7>
Mail-Followup-To: Bin Liu <b-liu@ti.com>, Tony Lindgren <tony@atomide.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        Merlijn Wajer <merlijn@wizzup.org>, Pavel Machek <pavel@ucw.cz>,
        Sebastian Reichel <sre@kernel.org>
References: <20191126034151.38154-1-tony@atomide.com>
 <20191212160059.GI16429@iaqt7>
 <20191212160946.GR35479@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191212160946.GR35479@atomide.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Dec 12, 2019 at 08:09:46AM -0800, Tony Lindgren wrote:
> Hi,
> 
> * Bin Liu <b-liu@ti.com> [191212 16:02]:
> > Hi Tony,
> > 
> > Sorry for my late response.
> 
> No worries.
> 
> > On Mon, Nov 25, 2019 at 07:41:51PM -0800, Tony Lindgren wrote:
> > > When disconnected as USB B-device, we sometimes get a suspend interrupt
> > > after disconnect interrupt. In that case we have devctl set to 99 with
> > > VBUS still valid and musb_pm_runtime_check_session() wrongly things we
> > > have an active session. We have no other interrupts after disconnect
> > > coming in this case at least with the omap2430 glue.
> > 
> > I don't have an omap2430 platform to test, but its musb doesn't generate
> > DISCONNECT interrupt at all when disconnected from USB host in any case?
> > It is a surprise, the musb core driver expects the DISCONNECT interrupt
> > after VBUS is lost and relies on it to tear down the gadget driver and
> > the state machine. I am wondering how its USB is functional without the
> > DISCONNECT event...
> 
> We do get DISCONNECT, but we can then get a SUSPEND after DISCONNECT
> has already happened..

Ahh, I missed the first sentence in the commit log...
Now I understand the issue. Thanks.

> 
> That will wake up musb waiting for further interrupts thinking it's
> connected. But after that there are no more interrupts as the cable
> is disconnected so we need to poll the status again.
> 
> If we see SUSPEND before DISCONNECT, then things idle fine.

Does SUSPEND always comes after DISCONNECT on omap2430, or just
sometimes? I guess the USB connector has some issue - when DP/DM pins
are disconnected, SUSPEND interrupt is generated; when VBUS/GND pins are
disconnected, DISCONNECT interrupt is generated. Because DP/DM pins are
shorter than VBUS/GND, SUSPEND should come before DISCONNECT.

-Bin.
