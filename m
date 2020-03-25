Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F0B21928FD
	for <lists+linux-omap@lfdr.de>; Wed, 25 Mar 2020 13:54:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727298AbgCYMyA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 25 Mar 2020 08:54:00 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:43434 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726700AbgCYMyA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 25 Mar 2020 08:54:00 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02PCriaI088061;
        Wed, 25 Mar 2020 07:53:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585140824;
        bh=Q5CWfzsnxnuYM9aY/RO/1o/G4qhiY2QpKLG3eWcQ064=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=kEIyGJTP2GUJJfFMUo3YzYoAnQOtzIsTfKmYxL30h3I1D2wdtaP8waTY6MLFQnEJK
         5tDQ0G0qliv2rEiqWTVtW+RB8DPXSAu9gJFf2XzOcjlY3K7k1PA1vp0UljJJky+EVn
         FIwi7y2zoL1MGdKMzh0odtm2vJW+8HULQ7GP5aEM=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02PCrhRI023793
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 25 Mar 2020 07:53:43 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 25
 Mar 2020 07:53:43 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 25 Mar 2020 07:53:43 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02PCrewo066456;
        Wed, 25 Mar 2020 07:53:41 -0500
Subject: Re: [PATCHv2 06/56] drm/omap: constify write buffers
To:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Rob Herring <robh@kernel.org>, <linux-omap@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <kernel@collabora.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
 <20200224232126.3385250-7-sebastian.reichel@collabora.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <d40b566e-c322-87cf-b9cc-72c4ebbed0aa@ti.com>
Date:   Wed, 25 Mar 2020 14:53:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200224232126.3385250-7-sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 25/02/2020 01:20, Sebastian Reichel wrote:
> The write buffers are not modified, so they can be constant.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>   drivers/gpu/drm/omapdrm/dss/dsi.c     | 24 ++++++++++++------------
>   drivers/gpu/drm/omapdrm/dss/omapdss.h | 10 +++++-----
>   2 files changed, 17 insertions(+), 17 deletions(-)

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
