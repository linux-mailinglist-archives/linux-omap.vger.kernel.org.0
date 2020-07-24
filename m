Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CDF522C7A6
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jul 2020 16:15:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726717AbgGXOPs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Jul 2020 10:15:48 -0400
Received: from mail-ej1-f65.google.com ([209.85.218.65]:41227 "EHLO
        mail-ej1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726317AbgGXOPs (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 Jul 2020 10:15:48 -0400
Received: by mail-ej1-f65.google.com with SMTP id w9so10122045ejc.8;
        Fri, 24 Jul 2020 07:15:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=y4s5NYs8Ph6jpkFhoIuh6xR0vXzxCRPsGUFORhwz1zU=;
        b=VuN7rzVrzX/xYBU2Why5FuahD9c95pZIcHZQlNQ4bo54fVF36TvHZzIQ8VHxsFQDr/
         vOG5HfukqUgJcxmxdIHB+6Vg1bX9vaCX95OjiSQJIwARc+pQfASje1JQLYoMg2ahJqbX
         ofR3XiZFVyoJvz/PN3vOvWiIjHmS72+1NAq5rL3YoAMNqKxlYvrY2yD7aLEGvn59ihJE
         XAiixHW0C/nLqtJEoSf7tFzDlQFJPQOqtqu4nWl2cbDt2yHGLwkjDM4cQJQgcw0GxCH+
         4RtvmaNYfFPkHfv778n9xMO+H6GiHwxdecKKkhLwWTRQbNSRdr53OAZaGLnxVHtPQI4t
         Vf9w==
X-Gm-Message-State: AOAM53302bvn0LfBbv79rUVOcL8R5vAmkTw71N9jkm/etuAqNdWQW9ud
        0u5xJFzcoKagF9RwqO8TSThvalxIB90=
X-Google-Smtp-Source: ABdhPJwu3EjA1YdWx+QFyiPcMnNuaujpfyOQ6rYY7C5/5mqX7nNv1mV0KGv6svxTy1tkMVz1WmKngg==
X-Received: by 2002:a17:906:7115:: with SMTP id x21mr9160281ejj.86.1595600146276;
        Fri, 24 Jul 2020 07:15:46 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
        by smtp.googlemail.com with ESMTPSA id i2sm848994edk.30.2020.07.24.07.15.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jul 2020 07:15:45 -0700 (PDT)
Date:   Fri, 24 Jul 2020 16:15:42 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Markus Mayer <mmayer@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Florian Fainelli <f.fainelli@gmail.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Roger Quadros <rogerq@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Kukjin Kim <kgene@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2 26/29] memory: fsl_ifc: Fix whitespace issues
Message-ID: <20200724141542.GB10663@kozik-lap>
References: <20200724074038.5597-1-krzk@kernel.org>
 <20200724074038.5597-27-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200724074038.5597-27-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Jul 24, 2020 at 09:40:35AM +0200, Krzysztof Kozlowski wrote:
> Fix minor whitespace and comment issues.  Do not break message strings.
> No functional changes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v1:
> 1. New patch
> ---
>  drivers/memory/fsl_ifc.c | 30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)

Applied (and part of pull request to arm-soc).

Best regards,
Krzysztof
