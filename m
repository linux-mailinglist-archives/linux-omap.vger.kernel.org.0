Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86BAE19AB97
	for <lists+linux-omap@lfdr.de>; Wed,  1 Apr 2020 14:23:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732253AbgDAMX6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 1 Apr 2020 08:23:58 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:38380 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726804AbgDAMX6 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 1 Apr 2020 08:23:58 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 031CNmac094694;
        Wed, 1 Apr 2020 07:23:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585743828;
        bh=U3aEUgKICYKpbqDjPtLZKLQC/R6IQxmLct6xsxQgjf4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=jDv7n+9bf55J5YE8TM20Zv45RBt5SfcNyryJ00Vw+sjAtIZsjkMRctkr+lpcL0awF
         iirEkQcKNxNWC4gNsFJVoZYyCXKVwTLX4cdFyAeY4Z3XOK0XXas5HkE3AvWh8yu3Ux
         jP3XDrvPoq+vRA+Zhtz0c1aKCVa5xhrUeatUPpGU=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 031CNmRH117071
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 1 Apr 2020 07:23:48 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 1 Apr
 2020 07:23:47 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 1 Apr 2020 07:23:47 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 031CNii7004464;
        Wed, 1 Apr 2020 07:23:45 -0500
Subject: Re: [PATCHv2 41/56] drm/omap: dsi: return proper error code from
 dsi_update_all()
To:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Rob Herring <robh@kernel.org>, <linux-omap@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <kernel@collabora.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
 <20200224232126.3385250-42-sebastian.reichel@collabora.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <d657f47f-5960-24d5-76dd-06f074e22a84@ti.com>
Date:   Wed, 1 Apr 2020 15:23:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200224232126.3385250-42-sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 25/02/2020 01:21, Sebastian Reichel wrote:
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>   drivers/gpu/drm/omapdrm/dss/dsi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index acbfffe83b3e..f629e6b1025b 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -3987,7 +3987,7 @@ static int dsi_update_all(struct omap_dss_device *dssdev)
>   			return r;
>   	}
>   
> -	return 0;
> +	return r;
>   }
>   
>   /* Display funcs */
> 

Shouldn't this be squashed to earlier patch?

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
