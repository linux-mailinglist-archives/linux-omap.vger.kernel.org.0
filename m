Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9109322E793
	for <lists+linux-omap@lfdr.de>; Mon, 27 Jul 2020 10:18:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726717AbgG0IRz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 27 Jul 2020 04:17:55 -0400
Received: from mail-ej1-f67.google.com ([209.85.218.67]:34442 "EHLO
        mail-ej1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbgG0IRz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 27 Jul 2020 04:17:55 -0400
Received: by mail-ej1-f67.google.com with SMTP id y10so16166584eje.1;
        Mon, 27 Jul 2020 01:17:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=E7aGMVBbgko2tboKSW/8bzhPgYImOO4fEvxr87lyS2k=;
        b=h0soYIgoZ0CqmiemCDMUMUBPI46IrKg84t0UZzwlUMzS4yI/2yWMxkj67QNfj0Bhlz
         Wd2hiX1kkAJ9vCyQmydyTWW0h3ZQtEkyKw+GR0/fi+2gnL2XvYNE2s4aaSArk9I7OcPV
         zC/Pwmr70v4KDG/+3WGRuDIhv0IlRh0pIa5UQHLvcTwvcdLCNuKFjznb9qC4iWab0lFH
         mg6SFGZo05YJv855dresTCqv5qaxFZsSZs7e/HWqdXTPzsZoaUpzRXgvXHWvd/Y0BjlP
         D5ZaFykeIbT5DnfmwlxT8TIoXrKHixQ7JHWYvfBhn5Hs39Pe/JJ9vNVC0nh7x9C4OIHl
         xCjg==
X-Gm-Message-State: AOAM5335HIdbbnA90mp7jMmmJ3bL2v6fTVlYZfObymZdar5xnZ6RaL58
        nPIW/hZZQeheanjwvzxfg87qkdqNl6Q=
X-Google-Smtp-Source: ABdhPJyrUVPjTHJCuMko8x4nzu7fSRmtm7c0iNZkzOhX7RgpOsciUH/ZRpt1cPE3kLgP1O6OOhXiWQ==
X-Received: by 2002:a17:906:82d4:: with SMTP id a20mr19026277ejy.165.1595837871933;
        Mon, 27 Jul 2020 01:17:51 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
        by smtp.googlemail.com with ESMTPSA id dj22sm6931988edb.54.2020.07.27.01.17.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jul 2020 01:17:50 -0700 (PDT)
Date:   Mon, 27 Jul 2020 10:17:48 +0200
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
Subject: Re: [PATCH v2 06/29] memory: Enable compile testing for most of the
 drivers
Message-ID: <20200727081748.GJ17644@kozik-lap>
References: <20200724074038.5597-1-krzk@kernel.org>
 <20200724074038.5597-7-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200724074038.5597-7-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Jul 24, 2020 at 09:40:15AM +0200, Krzysztof Kozlowski wrote:
> Most of the memory controller drivers do not depend on architecture
> specific code so can be compile tested to increase build coverage.
> 
> When compile tested, do not enable them by default.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v1:
> 1. When compile tested, do not enable them by default.
> ---
>  drivers/memory/Kconfig | 39 ++++++++++++++++++++++-----------------
>  1 file changed, 22 insertions(+), 17 deletions(-)

Applied to drivers/memory tree.

Best regards,
Krzysztof
