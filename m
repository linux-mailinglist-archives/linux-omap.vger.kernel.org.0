Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0546D3D3E
	for <lists+linux-omap@lfdr.de>; Fri, 11 Oct 2019 12:25:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726357AbfJKKZ3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 11 Oct 2019 06:25:29 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:42802 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726290AbfJKKZ2 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 11 Oct 2019 06:25:28 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9BAPLSw113550;
        Fri, 11 Oct 2019 05:25:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570789521;
        bh=k02BI/6YnixZV6Y7oYQEPBkyLz2KEQYQKTYvcuruyMs=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=MAqxw7nvetO4lZ5Ootqkjazx2nz0BN85f3eBKr1ZuPBaFpyF67MQOP/+8p6aSKpAC
         Vv3b9y+bsVJhmXwtj06Fti2v0Mgd0O8/73ycN2D8blTqj2gUNRvDtQLUQz070FyAWe
         2bqlxhi9V4Sz5ec+hq0qmkKl21LxDik8R+HSjNyU=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9BAPL3m044776
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 11 Oct 2019 05:25:21 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 11
 Oct 2019 05:25:17 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 11 Oct 2019 05:25:17 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9BAPJul107727;
        Fri, 11 Oct 2019 05:25:19 -0500
Subject: Re: [PATCHv2 7/7] drm/omap: hdmi4: fix use of uninitialized var
To:     Tony Lindgren <tony@atomide.com>
CC:     <dri-devel@lists.freedesktop.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jyri Sarha <jsarha@ti.com>, <linux-omap@vger.kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
References: <20190930103840.18970-1-tomi.valkeinen@ti.com>
 <20190930103840.18970-8-tomi.valkeinen@ti.com>
 <20191008141335.GB5610@atomide.com>
 <ffb498fb-5041-d3e9-2702-879f3d389adf@ti.com>
 <20191008142153.GD5610@atomide.com>
 <59381248-5ded-7ea9-40a6-cbfb58a3c5b1@ti.com>
 <20191010132407.GS5610@atomide.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <d7cb0f2a-1645-29ff-aaf2-2ec5188dbc24@ti.com>
Date:   Fri, 11 Oct 2019 13:25:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191010132407.GS5610@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 10/10/2019 16:24, Tony Lindgren wrote:

> Hmm so what register does this clock actually change?
> 
> I'm seeing an increase of few tens of extra mW, which means at
> least one day of standby time less for me :) It does not happen
> always, maybe half of the time.

I have no idea why this would affect power consumption. As far as I can 
understand, the bits written here are a clk divider MCLK. I don't see 
why that would affect.

Maybe Jyri or Peter has an idea, I have never looked at the HDMI audio side.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
