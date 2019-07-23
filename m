Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7493D71C3E
	for <lists+linux-omap@lfdr.de>; Tue, 23 Jul 2019 17:53:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732321AbfGWPx2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 23 Jul 2019 11:53:28 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:38888 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730033AbfGWPx2 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 23 Jul 2019 11:53:28 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6NFrHdq123362;
        Tue, 23 Jul 2019 10:53:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1563897197;
        bh=BnpzLYQscthG64FXJPL0D5x3+LttJD4n7FxCLVoQ0rA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=gkraDMxJpl13gmc0klMe62QZD5YLEBklo56Rv8top1IngDZE9KlmpfkvrrdenAnpw
         TQ8GrX5yR+mAPQyR0Oh8LrD66BgHfo9ZvM7y99x+1GiGruvaXAIsVrP8pU1F4MlKQo
         vOS5dopVL2UbV+bnnhcoATqIi3tx/ra1ezJKEwPM=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6NFrHbk101439
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 23 Jul 2019 10:53:17 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 23
 Jul 2019 10:53:17 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 23 Jul 2019 10:53:17 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6NFrG4X017922;
        Tue, 23 Jul 2019 10:53:16 -0500
Subject: Re: Backlight in motorola Droid 4
To:     Pavel Machek <pavel@ucw.cz>, <linux-omap@vger.kernel.org>,
        <tony@atomide.com>, <sre@kernel.org>, <nekit1000@gmail.com>,
        <mpartap@gmx.net>, <merlijn@wizzup.org>
CC:     <jacek.anaszewski@gmail.com>, <linux-kernel@vger.kernel.org>,
        <linux-leds@vger.kernel.org>
References: <20181219162626.12297-1-dmurphy@ti.com>
 <20190722205921.GA24787@amd>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <b8fbc94f-c087-2c9d-4532-ea423f1626e6@ti.com>
Date:   Tue, 23 Jul 2019 10:53:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190722205921.GA24787@amd>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Pavel

On 7/22/19 3:59 PM, Pavel Machek wrote:
> Hi!
>
> So now the backlight LED can be controlled. Good. (And thanks!)
>
> But I seem to remember that backlight had range from "is it really on?"
> to "very bright"; now it seems to have range from "bright" to "very
> bright".
>
> Any ideas what goes on there?

In the LM3552 driver we are changing the Full scale brightness registers 
for the

specific control bank.

#define LM3532_REG_CTRL_A_BRT    0x17
#define LM3532_REG_CTRL_B_BRT    0x19
#define LM3532_REG_CTRL_C_BRT    0x1b

In the ti-lmu code the ALS zones were being modified not the control 
bank brightness.

#define LM3532_REG_BRT_A            0x70    /* zone 0 */
#define LM3532_REG_BRT_B            0x76    /* zone 1 */
#define LM3532_REG_BRT_C            0x7C    /* zone 2 */

Not sure how the ALS is attached in the system if it reports to the host 
and the host manages

the back light or if the the ALS is connected directly to the LM3532.

Maybe the ALS zone targets need to be updated to allow a fuller range.  
The LM3532 may be stuck

in a certain zone.

Probably should set up the ALS properties in the device tree.

Dan

> Thanks,
> 									Pavel
>
