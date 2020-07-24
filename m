Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B6A222C7A1
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jul 2020 16:15:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726567AbgGXOPf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Jul 2020 10:15:35 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:42408 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726317AbgGXOPf (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 Jul 2020 10:15:35 -0400
Received: by mail-ed1-f68.google.com with SMTP id z17so7137478edr.9;
        Fri, 24 Jul 2020 07:15:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nOZ2EhtWCBrjRorAHCZte7RSZh4Nr/XFu5pAPPeshAs=;
        b=rjJG9Ek4Uk7ha5ZyfQNQwdSRji05mnuXmVlMqRB/FQ9WuylFIrcTNHGLR6Hjypbbwo
         5LvAy7GppAGgrtpCY1wgj6TtJNj59AiVzREJo/7JgIWx2DL2QlzXsTwBaM0wMNe5Yhuh
         4+7KutQA1fPwIX+e4xuF4FvqS0GhjJWS5Ifj1ms4Psab6EX8hB1tIQ47sYjnfse8G3JI
         ZLVvNsJ0EzKPsMcDJV2BLfGBQ+0dHVhk/IH7XDBDPiIV5CVRKZR/L71Q3h+fFKICzHgE
         TIQOOK8mzYOYJZVHHAK2dnclJERSe2vTf7H7la8Nl7Ge+XrA2a8lWWl4EiaDmGn8Q0y6
         cl4g==
X-Gm-Message-State: AOAM5332M3fkMaQkdB/cyG0nkpOxsNmEzDPLKCK9J0paJEEXUd2XIefT
        87DLT1HmE2JN/FUXGT+tlGU=
X-Google-Smtp-Source: ABdhPJwCnDwptUWPu+G+TpiJFfaUazAFE2hqpzKtAB4ZIpyBPFN1p7VAzZ9uPmDfPJ7y8jaLzjbtqQ==
X-Received: by 2002:a50:852a:: with SMTP id 39mr8845473edr.107.1595600132842;
        Fri, 24 Jul 2020 07:15:32 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
        by smtp.googlemail.com with ESMTPSA id v19sm821828eda.70.2020.07.24.07.15.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jul 2020 07:15:32 -0700 (PDT)
Date:   Fri, 24 Jul 2020 16:15:28 +0200
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
Subject: Re: [PATCH v2 27/29] memory: da8xx-ddrctl: Remove unused 'node'
 variable
Message-ID: <20200724141528.GA10663@kozik-lap>
References: <20200724074038.5597-1-krzk@kernel.org>
 <20200724074038.5597-28-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200724074038.5597-28-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Jul 24, 2020 at 09:40:36AM +0200, Krzysztof Kozlowski wrote:
> The variable 'node' is not used.  Remove it to silence compile warning:
> 
>     drivers/memory/da8xx-ddrctl.c: In function 'da8xx_ddrctl_probe':
>     drivers/memory/da8xx-ddrctl.c:105:22: warning: variable 'node' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v1:
> 1. New patch
> ---
>  drivers/memory/da8xx-ddrctl.c | 2 --
>  1 file changed, 2 deletions(-)

Applied (and part of pull request to arm-soc).

Best regards,
Krzysztof
