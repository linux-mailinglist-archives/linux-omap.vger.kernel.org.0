Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B2111F53C9
	for <lists+linux-omap@lfdr.de>; Wed, 10 Jun 2020 13:47:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728564AbgFJLrm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 10 Jun 2020 07:47:42 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:45662 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728468AbgFJLrm (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 10 Jun 2020 07:47:42 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05ABlNAC099893;
        Wed, 10 Jun 2020 06:47:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1591789643;
        bh=ioRilCxbxofFqmKinvjjfsaLPYOAZ7YlTqzwbfbXGm8=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=HuwTVqm1QnbI/HMSVwLVaDVG/GwaHPuqDy0+f0dbPSlTp+/uwwXI/RgnIN+ponio5
         n+hze31xDi/xXH8JLLNSTbKMv/3eOr0DKNJgfRklWMc2z12O5R2D16qS+Ss/gljbVb
         FchhuVTBM3YRDa0Ppj4KPuPnWP2/llqksmaqk7VQ=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05ABlNTm105773
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 10 Jun 2020 06:47:23 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 10
 Jun 2020 06:47:22 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 10 Jun 2020 06:47:22 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05ABlIx0077567;
        Wed, 10 Jun 2020 06:47:19 -0500
Subject: Re: [PATCH 1/5] drm/omap: Fix suspend resume regression after
 platform data removal
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, "Andrew F . Davis" <afd@ti.com>,
        Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <dri-devel@lists.freedesktop.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200531193941.13179-1-tony@atomide.com>
 <20200531193941.13179-2-tony@atomide.com>
 <16ba1808-5c7f-573d-8dd0-c80cac2f476e@ti.com>
 <20200603140639.GG37466@atomide.com>
 <47e286dd-f87a-4440-5bde-1f7b53e8b672@ti.com>
 <20200609151943.GL37466@atomide.com>
 <9ed70121-2a53-d2b3-051a-88eb83e6c53f@ti.com>
 <20200609165234.GM37466@atomide.com> <20200609171043.GN37466@atomide.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <7c4809d0-5262-a739-354a-61e617fe6c6e@ti.com>
Date:   Wed, 10 Jun 2020 14:47:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200609171043.GN37466@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 09/06/2020 20:10, Tony Lindgren wrote:

>> On beagle-x15 I see these errors after modprobe:
>>
>> DSS: OMAP DSS rev 6.1
>> omapdss_dss 58000000.dss: bound 58001000.dispc (ops dispc_component_ops [omapdss])
>> omapdss_dss 58000000.dss: bound 58040000.encoder (ops hdmi5_component_ops [omapdss])
>> [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
>> omapdrm omapdrm.0: [drm] Cannot find any crtc or sizes
>> [drm] Initialized omapdrm 1.0.0 20110917 for omapdrm.0 on minor 0
>> omapdrm omapdrm.0: [drm] Cannot find any crtc or sizes
>> aic_dvdd_fixed: disabling
>> ldousb: disabling
>>
>> Maybe I'm missing some related module on x15?
> 
> Still did not figure what I might be missing on x15 :)

The log above shows that nothing is missing, omapdrm has probed fine. But it cannot see anything 
connected to the hdmi port. Are you booting with correct dtb for your x15 revision? And you have a 
monitor connected? =)

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
