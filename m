Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B0E171F59
	for <lists+linux-omap@lfdr.de>; Tue, 23 Jul 2019 20:31:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388455AbfGWSbl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 23 Jul 2019 14:31:41 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:36372 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727021AbfGWSbl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 23 Jul 2019 14:31:41 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6NIVaCT063191;
        Tue, 23 Jul 2019 13:31:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1563906696;
        bh=9cv0+/SVJMPPDN0ZhXDWZYsyy291EnVoJwpIzV02j8M=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=SeHacVK8t8RCkv+qAMQXCHTb6PB5lzmPbPg+KdmGrP+jyoTeiqZD0/n1ltfNLbthV
         x7QfW3TGGjmgaa/0bqdDHOHZUzwJjtHyA63cjRBgwevKfkv/g92Dr4/MBFo7eGzDD4
         7oiKUwn7vFUJfLYTwAlaNeX2eS2s+o4s4RbIb+VY=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6NIVaKB079235
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 23 Jul 2019 13:31:36 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 23
 Jul 2019 13:31:36 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 23 Jul 2019 13:31:36 -0500
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6NIVZ6q129119;
        Tue, 23 Jul 2019 13:31:36 -0500
Subject: Re: [PATCH 3/8] bus: ti-sysc: Fix handling of forced idle
To:     Tony Lindgren <tony@atomide.com>, <linux-omap@vger.kernel.org>
CC:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Tero Kristo <t-kristo@ti.com>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20190723112811.44381-1-tony@atomide.com>
 <20190723112811.44381-4-tony@atomide.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <4336e7ef-3857-e42f-e67c-94809acc59b8@ti.com>
Date:   Tue, 23 Jul 2019 13:31:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190723112811.44381-4-tony@atomide.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 7/23/19 6:28 AM, Tony Lindgren wrote:
> For some devices we can get the following warning on boot:
> 
> ti-sysc 48485200.target-module: sysc_disable_module: invalid midlemode
> 
> Fix this by treating SYSC_IDLE_FORCE like we do for the other bits
> for idlemodes mask.
> 
> Fixes: d59b60564cbf ("bus: ti-sysc: Add generic enable/disable functions")
> Cc: Roger Quadros <rogerq@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>

Reviewed-by: Suman Anna <s-anna@ti.com>

regards
Suman

> ---
>  drivers/bus/ti-sysc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
> --- a/drivers/bus/ti-sysc.c
> +++ b/drivers/bus/ti-sysc.c
> @@ -949,7 +949,7 @@ static int sysc_best_idle_mode(u32 idlemodes, u32 *best_mode)
>  		*best_mode = SYSC_IDLE_SMART_WKUP;
>  	else if (idlemodes & BIT(SYSC_IDLE_SMART))
>  		*best_mode = SYSC_IDLE_SMART;
> -	else if (idlemodes & SYSC_IDLE_FORCE)
> +	else if (idlemodes & BIT(SYSC_IDLE_FORCE))
>  		*best_mode = SYSC_IDLE_FORCE;
>  	else
>  		return -EINVAL;
> 

