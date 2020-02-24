Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27D8316A356
	for <lists+linux-omap@lfdr.de>; Mon, 24 Feb 2020 11:00:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727189AbgBXKAJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Feb 2020 05:00:09 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:42295 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726509AbgBXKAI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 24 Feb 2020 05:00:08 -0500
Received: by mail-wr1-f66.google.com with SMTP id p18so5966070wre.9
        for <linux-omap@vger.kernel.org>; Mon, 24 Feb 2020 02:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=5kMWKYrh992GZWTACf9amzemAuduDOlF955KN5EwvQw=;
        b=wOJl5CgbQy6U3aWnwofJi51rIVWN4K+Ld9+tffFieiVlVfi2/dHqXF40Cq3T1kb4Hd
         JUNcqOCZ8LswILeUgNcr8bP9l5VvdXg6prdZboDZ0FklYR/nEO/5G5+SLS2xyvII0M8O
         MyPUv37S1xPx4szsummDjBD7YuBDtftwpdc1a/douez9IdwrT/1qWH81PPr5mWk5S5ZX
         Dr6JVrft/D6igiJSAztEKvVYmr3wkssu/UxOPrnYXEYS1jrqH3t1kEYNrzRLZy50NY+k
         2LTdsT4gZ8wC7Xunm8aJACAx3yBq5deU3CkCN7mubwdZRtAB9YKvzKBmufAgRjdi8ydd
         L/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=5kMWKYrh992GZWTACf9amzemAuduDOlF955KN5EwvQw=;
        b=uG5X2UiXUO0pEWg7Z6q9LRiiUkEgvigqWpPkuakR8EfjGqHV9FLz8oHBV/AqpcIFOx
         oMPgCj8cSQIxexLGk/1ZQX59aoGOC8dcBqECjSB82nTSZ3hmJKip3zNAL84w/C5uqIdO
         KeTx442uQspDkRnQi8QJmr8xaAdL2ez5IA+GdkrRG0xMtBoUU1anZOXr1Bdt5uyVK0Gm
         wQRmYkmNjzQevzoO5opIpgx/7Lzoep0A/yli8gF/VoquzMXu5wDwpDC7sGvCT8hRVktW
         uv0QB4aoAxVQL+FJOyYibKg2rVw7XHP9HPczYluR7uRCIPmiHrpVp5VuJ4+5Nth1J9ex
         j1iA==
X-Gm-Message-State: APjAAAV/z4YugJOcmo9KWuEjSnRX7B2/TRrOhPzM0pJkcaIyMkf37jmI
        tJ4O8bF2EDKRc96jvoWANs+xwg==
X-Google-Smtp-Source: APXvYqw+eVT/ekOFVzqh6k7LzKVEDiUtf7y1cMrybh2fcleVG3PtFkiVzf5QhVfc93XqXI91aPlTag==
X-Received: by 2002:a5d:45ca:: with SMTP id b10mr9472914wrs.250.1582538406847;
        Mon, 24 Feb 2020 02:00:06 -0800 (PST)
Received: from dell ([2.31.163.122])
        by smtp.gmail.com with ESMTPSA id v1sm11105968wrp.16.2020.02.24.02.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2020 02:00:06 -0800 (PST)
Date:   Mon, 24 Feb 2020 10:00:37 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        David Lechner <david@lechnology.com>,
        Tony Lindgren <tony@atomide.com>,
        Roger Quadros <rogerq@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH v2] mfd: syscon: Use a unique name with regmap_config
Message-ID: <20200224100037.GK3494@dell>
References: <20200127231208.1443-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200127231208.1443-1-s-anna@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, 27 Jan 2020, Suman Anna wrote:

> The DT node full name is currently being used in regmap_config
> which in turn is used to create the regmap debugfs directories.
> This name however is not guaranteed to be unique and the regmap
> debugfs registration can fail in the cases where the syscon nodes
> have the same unit-address but are present in different DT node
> hierarchies. Replace this logic using the syscon reg resource
> address instead (inspired from logic used while creating platform
> devices) to ensure a unique name is given for each syscon.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
> v2: Fix build warning reported by kbuild test bot
> v1: https://patchwork.kernel.org/patch/11346363/
> 
>  drivers/mfd/syscon.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Waiting for Arnd to review.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
