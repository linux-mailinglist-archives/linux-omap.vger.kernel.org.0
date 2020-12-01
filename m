Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED0562CA168
	for <lists+linux-omap@lfdr.de>; Tue,  1 Dec 2020 12:36:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728047AbgLALat (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 1 Dec 2020 06:30:49 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:58736 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727717AbgLALas (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 1 Dec 2020 06:30:48 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B1BT6x3045515;
        Tue, 1 Dec 2020 05:29:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1606822146;
        bh=IcrP9OzQKc8RCrJ7C55QR7OHyEI8FM6gU5EecxytYXM=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=XSnpCQftAzcaHZ4eOiksfX8vz0dy0TuXDPEmwAzviaTNkLh7uhmhrloFxqCUEuejQ
         1GZOco+fFry4ULBHg84Q2aE9pX57fYvebfmFz2xVKpW0bVdIP601dFaqwhLPyX0KVE
         HPNlEPuTujluRr/l3MfZvrBSO6M9Kbq/iw93ayKg=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B1BT62k061259
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 1 Dec 2020 05:29:06 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 1 Dec
 2020 05:29:06 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 1 Dec 2020 05:29:06 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B1BT4ni009249;
        Tue, 1 Dec 2020 05:29:04 -0600
Subject: Re: [PATCH v4 69/80] drm/panel: panel-dsi-cm: add panel database to
 driver
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Sebastian Reichel <sre@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <linux-omap@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>,
        <hns@goldelico.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-70-tomi.valkeinen@ti.com>
 <20201201002354.GN25713@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <54440345-f3d9-be2b-c3c3-97506e31cb5f@ti.com>
Date:   Tue, 1 Dec 2020 13:29:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201201002354.GN25713@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 01/12/2020 02:23, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Tue, Nov 24, 2020 at 02:45:27PM +0200, Tomi Valkeinen wrote:
>> Add a panel database to the driver instead of reading propertes from DT
>> data. This is similar to panel-simple, and I believe it's more future
>> safe way to handle the panels.
> 
> No need to care about backward compatibility ?

I don't think this breaks backward compatibility. The data from the board files is now in the panel
driver. The old dts files should continue working fine.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
