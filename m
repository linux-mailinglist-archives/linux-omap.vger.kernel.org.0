Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 559F922C79C
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jul 2020 16:13:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726758AbgGXONh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Jul 2020 10:13:37 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55619 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726719AbgGXONh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 Jul 2020 10:13:37 -0400
Received: by mail-wm1-f67.google.com with SMTP id 9so8080354wmj.5;
        Fri, 24 Jul 2020 07:13:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=IOGzJ6cY2FjYdFpjVdtQFQ2yTS4SILz/gGUSj1jCM6U=;
        b=qAyAJcWweKwfWmjl+uwT2JTXTjtrxkUvjmgWuw2xLrSTOF3/uYhzbGtJvGY/wpwXKG
         /oKPELLid06/sQmRrYDC0M7Y64f2ywzNiTBB1r55TdQm4/QUrWI2awpGrZteLE5QR8dl
         v858jeGEjSbKUcaOrPnqnxwAklI9cR1zNAlTHR1vK9DHFf5fGaubEGepWnQW2Tn4e2nF
         61heGq+rXYDknrYpIy1xFUPveiPTxKIiNyau7u8A9Rib8d6p3V/dt8RlLf8jdBXYP7JO
         TOtx1cn16QSn8iT0qLax0fe4Hnu7ieAiG72N8QsyELDi7VuLyqBVBdQ/h7r3F/0CwkvL
         mLpw==
X-Gm-Message-State: AOAM533p5Augq3ejPy1lPMxoLiXR5ovL55KiWTVfgGDDt6+MyeLgk7Os
        NVy5aA+6Vx9uTj5COXrJE9g=
X-Google-Smtp-Source: ABdhPJwL+QeVZyCxyJDZBcmgW5Pvgk096UsvgpB8okMSIFclx8Xu4901fsQGaQOHTWUHjjTjXaZfBQ==
X-Received: by 2002:a1c:8094:: with SMTP id b142mr8846186wmd.122.1595600013959;
        Fri, 24 Jul 2020 07:13:33 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
        by smtp.googlemail.com with ESMTPSA id g126sm7375209wme.16.2020.07.24.07.13.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jul 2020 07:13:33 -0700 (PDT)
Date:   Fri, 24 Jul 2020 16:13:29 +0200
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
Subject: Re: [PATCH v2 19/29] memory: mtk-smi: Add argument to function
 pointer definition
Message-ID: <20200724141329.GJ14851@kozik-lap>
References: <20200724074038.5597-1-krzk@kernel.org>
 <20200724074038.5597-20-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200724074038.5597-20-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Jul 24, 2020 at 09:40:28AM +0200, Krzysztof Kozlowski wrote:
> Fix checkpatch warning:
>     WARNING: function definition argument 'struct device *' should also have an identifier name
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/memory/mtk-smi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied (and part of pull request to arm-soc).

Best regards,
Krzysztof
