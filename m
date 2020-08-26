Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B9552536B3
	for <lists+linux-omap@lfdr.de>; Wed, 26 Aug 2020 20:22:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726609AbgHZSWh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 26 Aug 2020 14:22:37 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:39111 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726241AbgHZSWh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 26 Aug 2020 14:22:37 -0400
Received: by mail-ed1-f65.google.com with SMTP id c10so2593751edk.6;
        Wed, 26 Aug 2020 11:22:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=47B2W9chqSleNpfDGutHaxEQjzT9C3+pWqaOpYKfY50=;
        b=PbNx2hzX7W/T0GGXa9B88D3soPnMMENlLihfgZ8FzFbjE9b8QQZOZ/1XShjOqbtFdz
         USxIJNfPzlQwIWXqSw5RU+WmRN7735lcA7obYZgIuBWSGR5KxqXfw//5AasaZiia8deu
         h4sHGKnUJ4fdY9/Fyu7UPtxku2U5VVkVelpO8xya8G8wfdeI56TezV8cQKoCY5QG/Q4l
         PMmuUiFVwNj8uVDX1suZLFucTrxIqClbP/lcEstE40JwM7pej5zV6YzYGuhAhK0+3X3d
         X0w/qD9BjATTRgSo0YQ4OETNoHa2IveuVfgHdMui5WCLk8CSiTf4cAvn6J3OhsrdlG0s
         4s3A==
X-Gm-Message-State: AOAM533HbuNE/BulVDMU4U29CvnkwRaZFrqzOQ1PLL4BipCT9V4XgJyE
        RLPmxomTGP31z89QaUQppt4=
X-Google-Smtp-Source: ABdhPJyd9xYN9KNF7syF5JCDBo85byE7AJMEAitafvWaoIZ8nSo+RsrNr+IBot47UFGzmZ5z8L8emg==
X-Received: by 2002:a05:6402:1b02:: with SMTP id by2mr12999107edb.95.1598466155084;
        Wed, 26 Aug 2020 11:22:35 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
        by smtp.googlemail.com with ESMTPSA id a23sm2954376eju.43.2020.08.26.11.22.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Aug 2020 11:22:34 -0700 (PDT)
Date:   Wed, 26 Aug 2020 20:22:32 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Roger Quadros <rogerq@ti.com>, Tony Lindgren <tony@atomide.com>,
        Jon Hunter <jon-hunter@ti.com>, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] memory: omap-gpmc: Fix a couple off by ones
Message-ID: <20200826182232.GA11327@kozik-lap>
References: <20200825104707.GB278587@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200825104707.GB278587@mwanda>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Aug 25, 2020 at 01:47:07PM +0300, Dan Carpenter wrote:
> These comparisons should be >= instead of > to prevent reading one
> element beyond the end of the gpmc_cs[] array.
> 
> Fixes: cdd6928c589a ("ARM: OMAP2+: Add device-tree support for NOR flash")
> Fixes: f37e4580c409 ("ARM: OMAP2: Dynamic allocator for GPMC memory space")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/memory/omap-gpmc.c | 4 ++--

Thanks, applied.

Best regards,
Krzysztof

