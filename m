Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8623E26C97F
	for <lists+linux-omap@lfdr.de>; Wed, 16 Sep 2020 21:12:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727035AbgIPRmx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 16 Sep 2020 13:42:53 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:35921 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727297AbgIPRmX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 16 Sep 2020 13:42:23 -0400
Received: by mail-wr1-f67.google.com with SMTP id z1so7816258wrt.3;
        Wed, 16 Sep 2020 10:42:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mZM+DPpEcfwHy6w47m49YsAp4ppTWvN4oVK5Trply5g=;
        b=iRcuxEzQgB8dgm7yMOhc4w1BhwvEIoRat6t47aB6E+n2kgERaqKg2qs9LH9scR/zBs
         PqFc3iiBsFxHiIPnzELU2OB+JXaDhEawHB6nMZw4xxv6mc6I424ZoGpHsT+0XxIrPQiJ
         lRqUh9wI1QnaS4VCuVmCLTRNpRDT0Q+xwUslnWBwpqJjSX5Bjp4Q2CZc8PkIXceodbe+
         EYCiTsdwM5Fnoq3PpSXJAmXcpAaR3Dp0+bEM1ZgN2QuwayFXYaK8fVOr98RknC6exsKr
         hG639S0ZcDL+BoeGm1WSDSVf4+ZCLzMjsAylgNVNOqWJF4uy/HVrGfppH7TK4lYohQ/o
         Bdrw==
X-Gm-Message-State: AOAM532ByHabZUnys4CsUKTh7wq8gEHWkEYsINs+KklNFcWY6/+u21HE
        oo6TfTy5OjqCN2MGtgU4sY/0XGSo6Q7+wYDw
X-Google-Smtp-Source: ABdhPJxqTflk58WRHyVtD9XbqL9Q118Cqj3AUT87A43/ZCuGySbyxf6K/9H38Cgpf4SCgzC076Bv/g==
X-Received: by 2002:a5d:634d:: with SMTP id b13mr28939753wrw.324.1600278141285;
        Wed, 16 Sep 2020 10:42:21 -0700 (PDT)
Received: from kozik-lap ([194.230.155.191])
        by smtp.googlemail.com with ESMTPSA id f6sm34757724wro.5.2020.09.16.10.42.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Sep 2020 10:42:20 -0700 (PDT)
Date:   Wed, 16 Sep 2020 19:42:18 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Roger Quadros <rogerq@ti.com>, Tony Lindgren <tony@atomide.com>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] memory: omap-gpmc: Fix compile test on SPARC
Message-ID: <20200916174218.GA23084@kozik-lap>
References: <20200911143251.399-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200911143251.399-1-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Sep 11, 2020 at 04:32:51PM +0200, Krzysztof Kozlowski wrote:
> SPARC comes without CONFIG_OF_ADDRESS thus compile testing fails on
> linking:
> 
>   /usr/bin/sparc64-linux-gnu-ld: drivers/memory/omap-gpmc.o: in function `gpmc_probe_generic_child':
>   omap-gpmc.c:(.text.unlikely+0x14ec): undefined reference to `of_platform_device_create'
> 
> Fixes: ea0c0ad6b6eb ("memory: Enable compile testing for most of the drivers")
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/memory/Kconfig | 1 +
>  1 file changed, 1 insertion(+)

Applied.

Best regards,
Krzysztof

