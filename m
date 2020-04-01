Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 696D819ABEA
	for <lists+linux-omap@lfdr.de>; Wed,  1 Apr 2020 14:43:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732528AbgDAMns (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 1 Apr 2020 08:43:48 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:37656 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732396AbgDAMns (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 1 Apr 2020 08:43:48 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 031ChTK6066990;
        Wed, 1 Apr 2020 07:43:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585745010;
        bh=fA6Bmj6h2m2Ti5a8juJ0Xq7WDf2xLfwNzSplXtG+cKQ=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=fP0OYjbvgpKZTmNEQFa5ejyNzl6qwK23fLf8YZQGS63C8+AomvHM2c+Io/1GGQUz3
         Yps+vt1q1TZ99YeOWXviqHWZsohWmftsZOxVtiaRSrHbEGAFOwezx4QqG/0cDULlPl
         1k170Y+OVCvHx4Wm3Quh62tl7Umrr4f+YLYUvotk=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 031ChTKX083499
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 1 Apr 2020 07:43:29 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 1 Apr
 2020 07:43:29 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 1 Apr 2020 07:43:29 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 031ChRjD010837;
        Wed, 1 Apr 2020 07:43:27 -0500
Subject: Re: [PATCHv2 00/56] drm/omap: Convert DSI code to use drm_mipi_dsi
 and drm_panel
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        Sebastian Reichel <sre@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Rob Herring <robh@kernel.org>, <linux-omap@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <kernel@collabora.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
 <32b73b0a-a5f6-e311-b2d5-95e333f039a4@ti.com>
 <20200325130358.GE19171@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <928b0af8-a9bd-0d13-afdf-ec17366330b9@ti.com>
Date:   Wed, 1 Apr 2020 15:43:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200325130358.GE19171@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 25/03/2020 15:03, Laurent Pinchart wrote:
> Hi Tomi,
> 
> On Wed, Mar 25, 2020 at 02:47:48PM +0200, Tomi Valkeinen wrote:
>> On 25/02/2020 01:20, Sebastian Reichel wrote:
>>> This updates the existing omapdrm DSI code, so that it uses
>>> common drm_mipi_dsi API and drm_panel.
>>>
>>> The patchset has been tested with Droid 4 using Linux console, X.org and
>>> Weston. The patchset is based on Laurent Pinchartl's patch series [0]
>>> and removes the last custom panel driver, so quite a few cleanups on the
>>> omapdrm codebase were possible.
>>
>> This is a big series, and I suggest to keep the cleanups to minimum.
>> Things can be cleaned up afterwards after the functional parts of this
>> series have been merged.
> 
> There are a few cleanups at the bottom of the series that could be
> merged without waiting for the rest though :-)

Yep. So, Sebastian, if there are patches that can be applied independently of this series, can you 
send those separately or move them to the beginning of the series.

There was also the change to include/drm/drm_mipi_dsi.h which is outside the OMAP context. Maybe 
send that separately to the relevant maintainers. Or at least cc them, as now it's kind of hidden 
between all the omap changes.

And I need to try to wake up one of my boards with a DSI video mode display for testing...

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
