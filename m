Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAF6E12714F
	for <lists+linux-omap@lfdr.de>; Fri, 20 Dec 2019 00:17:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726880AbfLSXRn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 19 Dec 2019 18:17:43 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:39818 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726818AbfLSXRn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 19 Dec 2019 18:17:43 -0500
Received: by mail-oi1-f194.google.com with SMTP id a67so3885533oib.6;
        Thu, 19 Dec 2019 15:17:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RQAQf0fYNzNJ7qgqm77j2QW7mptfPU6+CVPjrrL7+UU=;
        b=uaklA5Kq70HLPyZCcoCq8ngMxJZee86ke4bNmTzoxQrWexMyF8tXoh5Ms3ISgEflTv
         OzFskmCJShouviJ04FiLKdZR9dGf5tZ1ahMc4zLckIAFo+/Smc3QRM5ZzD3ZlrLQQWBI
         uskQrhkIJbhNCK0DAPDcFE1EJzNogtnrQWyoygspkE7ehvodG5bNQ3FlM8+pHfky00/+
         EcL3kbaGsvTRwBIGd/bb8cNKlgkyv20km2qF4UFEZeaARfGBMt1IrFAqO4zydPp1St6f
         eRVIbaFc+PJrYvrff+VSFTgd7QHmGMvavERvxvXG6gwyGiIlWTz6FqmJmnz1s8FujgLL
         Kczw==
X-Gm-Message-State: APjAAAV+BKmLn3nVe5BNHaO7iA3R2Klf1r0j7eDyG083CLGH50zCOfyn
        oiROYzS6xs3DAyAndNuacQ==
X-Google-Smtp-Source: APXvYqwdiHEZLaKWjnUr8EgDy4jpIOZl30e1VqbwbFDPJ0w07okseYF9J6RsuWNMLHc59v+4eznyPg==
X-Received: by 2002:a05:6808:b13:: with SMTP id s19mr3049156oij.119.1576797462857;
        Thu, 19 Dec 2019 15:17:42 -0800 (PST)
Received: from localhost (ip-184-205-174-147.ftwttx.spcsdns.net. [184.205.174.147])
        by smtp.gmail.com with ESMTPSA id m89sm1338610otc.41.2019.12.19.15.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 15:17:41 -0800 (PST)
Date:   Thu, 19 Dec 2019 17:17:40 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dave Gerlach <d-gerlach@ti.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        Dave Gerlach <d-gerlach@ti.com>
Subject: Re: [PATCH 1/5] dt-bindings: arm: cpu: Add TI AM335x and AM437x
 enable method
Message-ID: <20191219231740.GA22285@bogus>
References: <20191213030755.16096-1-d-gerlach@ti.com>
 <20191213030755.16096-2-d-gerlach@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191213030755.16096-2-d-gerlach@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, 12 Dec 2019 21:07:51 -0600, Dave Gerlach wrote:
> Add enable-method binding for "ti,am3352" and "ti,am4372".
> 
> Signed-off-by: Dave Gerlach <d-gerlach@ti.com>
> ---
> CC: Rob Herring <robh+dt@kernel.org>
> ---
>  Documentation/devicetree/bindings/arm/cpus.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
