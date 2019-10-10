Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1B41D20A0
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2019 08:07:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732851AbfJJGHp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Oct 2019 02:07:45 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:50650 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726983AbfJJGHo (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 10 Oct 2019 02:07:44 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9A67UEX086822;
        Thu, 10 Oct 2019 01:07:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570687650;
        bh=Q7xfKuJxFGsgBt7CYsZwY4iPtTun5WksOT/5pTi+waY=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=VurlgsLtbiJZI6YUPF27329Ik8EUiYHAd1lj1vuHfnKgxkIsQlKt7Chygjag1e4qp
         yaS7Q0vZwJLVVj4TcdxOeFA6ERI0GDSvhTTttYD6MKSuS2Mi/8TyCN27Y3wRAKsn/w
         IHFHsDn5pxqKCZ35Y4yoQ0NGFPHJxQbATFGCgZ5U=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9A67Un6059669
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 10 Oct 2019 01:07:30 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 10
 Oct 2019 01:07:30 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 10 Oct 2019 01:07:30 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9A67SQo127475;
        Thu, 10 Oct 2019 01:07:28 -0500
Subject: Re: omapdrm: dsi panels
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
CC:     linux-omap <linux-omap@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, <kernel@pyra-handheld.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sebastian Reichel <sre@kernel.org>
References: <3C538A9E-BCE9-4ECF-97C2-52E823266296@goldelico.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <a84c175e-3d78-6d51-2018-179d828fc7c7@ti.com>
Date:   Thu, 10 Oct 2019 09:07:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <3C538A9E-BCE9-4ECF-97C2-52E823266296@goldelico.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On 10/10/2019 09:02, H. Nikolaus Schaller wrote:
> Hi Tomi,
> now as DPI panels have been moved to drm/panel are there plans to
> support DSI panels sitting there as well?
> 
> I have looked to move our boe-w677l driver for the omap5/Pyra handheld
> but it seems there are still some omapdrm dependencies.

No, OMAPDSS DSI support has not been moved to DRM model yet. I believe 
Sebastian has been looking at that.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
