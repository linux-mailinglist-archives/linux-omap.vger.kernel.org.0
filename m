Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01D8A1449DB
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jan 2020 03:34:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729014AbgAVCe5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Jan 2020 21:34:57 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:37203 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727590AbgAVCe5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 21 Jan 2020 21:34:57 -0500
Received: by mail-oi1-f196.google.com with SMTP id z64so4724857oia.4;
        Tue, 21 Jan 2020 18:34:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xu4UVbzw5q/AJ/ohJxRSgN5x13BSP7On39rYAJwa4OE=;
        b=rTTjT29rH51bRmWAXHjdC6SzAt/gCK4fHBxnCkftaAmZq0EDxxQLR3P4rTP6VjOw+n
         n0z/FERX9ZAeela3QXRysG9Ob+pbc3xkdC8QSCtu8a8BjrrNDSCYpCW3bgIaoqq5PoQI
         JhcVGywv1kfgRIv3LjWX9ARFXWchAe/L0h10XqAHymDHmFQ5zN4D3nC73iKnhEgzXS8H
         B0yyFF2w4CJ9uhp21/uFkLnVSqqk6t9FCcaGmDjcAYMsDH3DCXZb7I4lfmuEpAsmri5y
         QyM9ox5BQQS81lCjkYGO7uNh4S+6OmlW4wKhafpERtBgcEKXugn00CnhkYaVU3o4+7MI
         jrxg==
X-Gm-Message-State: APjAAAW96IHbNq7bwD4f08lvTH89//W2A4/GBzqFYQddn5V6tyy3IJmx
        mWIIYxh2HFHKsIGJyL6SRQ==
X-Google-Smtp-Source: APXvYqylhydEC5uYb2bBmyRcNJOYN2sHqUGX2MwoudpWA/8T3mi+kOtVZXjHOXNvoIp4vEhhVVyHpg==
X-Received: by 2002:a05:6808:486:: with SMTP id z6mr5503344oid.117.1579660496379;
        Tue, 21 Jan 2020 18:34:56 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j10sm14215256otr.64.2020.01.21.18.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2020 18:34:55 -0800 (PST)
Received: (nullmailer pid 5877 invoked by uid 1000);
        Wed, 22 Jan 2020 02:34:54 -0000
Date:   Tue, 21 Jan 2020 20:34:54 -0600
From:   Rob Herring <robh@kernel.org>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     bjorn.andersson@linaro.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        mathieu.poirier@linaro.org, s-anna@ti.com,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        Tero Kristo <t-kristo@ti.com>
Subject: Re: [PATCHv5 01/14] dt-bindings: remoteproc: Add OMAP remoteproc
 bindings
Message-ID: <20200122023454.GA5809@bogus>
References: <20200116135332.7819-1-t-kristo@ti.com>
 <20200116135332.7819-2-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200116135332.7819-2-t-kristo@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, 16 Jan 2020 15:53:19 +0200, Tero Kristo wrote:
> From: Suman Anna <s-anna@ti.com>
> 
> Add the device tree bindings document for the IPU and DSP
> remote processor devices on OMAP4+ SoCs.
> 
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Suman Anna <s-anna@ti.com>
> [t-kristo@ti.com: converted to schema]
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
> v5:
>   - enforced ordering of reg-names
>   - removed ti,bootreg-shift, instead added this under ti,bootreg
>     property
>   - renamed ti,autosuspend-delay to ti,autosuspend-delay-ms
>   - fixed required property handling
>   - fixed the omap5 ipu example firmware name extension
>   
>  .../remoteproc/ti,omap-remoteproc.yaml        | 322 ++++++++++++++++++
>  1 file changed, 322 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,omap-remoteproc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
