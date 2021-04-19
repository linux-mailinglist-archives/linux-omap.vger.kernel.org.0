Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C23D0364035
	for <lists+linux-omap@lfdr.de>; Mon, 19 Apr 2021 13:04:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232344AbhDSLF0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 19 Apr 2021 07:05:26 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:56184 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbhDSLFZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 19 Apr 2021 07:05:25 -0400
Received: from mail-ej1-f71.google.com ([209.85.218.71])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lYRi3-0002gF-Eb
        for linux-omap@vger.kernel.org; Mon, 19 Apr 2021 11:04:55 +0000
Received: by mail-ej1-f71.google.com with SMTP id k5-20020a1709061c05b029037cb8a99e03so3491100ejg.16
        for <linux-omap@vger.kernel.org>; Mon, 19 Apr 2021 04:04:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rmmgqTm+14dah62/nL48FwNXg3AN08p9OkUED0cAEDo=;
        b=kMOp6/je+RoUAlxneQBJpJoyNKwQSnVIA3IjT4XcIITQrAwxK6ZAc4bXfrSjEB1M+D
         0vrfeEdAh4mlsmll3MyHFi+ssquAmQ17toMZ8Kk2XLq7+UUBD70njDZGXV3XPZGm3oXa
         CzWVO1aSCYSDxoY2dyGUYdy27ivE/FyIQVkVWM5qABbYzbqAGfDNpd0astdkRtAqQ64a
         ZPJuUb6WW+g5A1FAbl9nKokKT70BFuxKhMHTNUgLvsJA4PvnrW70KQMtIRzCv0b2pKjX
         gAXxWhSE5nHus17hr4h9zOhf8C94OvMhOkSKhA2B4tLeRH5IjKfEulFhSEblYrydoqtA
         O0AA==
X-Gm-Message-State: AOAM533nh4TYhd5USLv2aZxbLm8+skkj6xVFJhU/HO4SL46a1JfVDhwh
        gdNALnu1/A5qegkIFAPIrXUTFS8kos/5vTtqY0qBBbSCvMD6GLa/7yPvaup+OycR82fhOMKTlA1
        shY508k25pHVmxjcqRmsuM+g50/cORaHPiXsW5Rk=
X-Received: by 2002:a50:ee17:: with SMTP id g23mr25157227eds.45.1618830295257;
        Mon, 19 Apr 2021 04:04:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLhshrkmIn+obTvsmXNoesducAwfvWh+CLyV7FaE2SkNPnhgqKAWXBmJSAf7QOw6eaSyUr+A==
X-Received: by 2002:a50:ee17:: with SMTP id g23mr25157215eds.45.1618830295145;
        Mon, 19 Apr 2021 04:04:55 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-192-147.adslplus.ch. [188.155.192.147])
        by smtp.gmail.com with ESMTPSA id b22sm9881378edr.52.2021.04.19.04.04.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Apr 2021 04:04:54 -0700 (PDT)
Subject: Re: [PATCH 4/7] mfd: da9052: Simplify getting of_device_id match data
To:     Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20210419081726.67867-1-krzysztof.kozlowski@canonical.com>
 <20210419081726.67867-4-krzysztof.kozlowski@canonical.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <152ee5cc-878a-310d-b1c9-76a983ee25e8@canonical.com>
Date:   Mon, 19 Apr 2021 13:04:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210419081726.67867-4-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 19/04/2021 10:17, Krzysztof Kozlowski wrote:
> Use of_device_get_match_data() to make the code slightly smaller.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  drivers/mfd/da9062-core.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)

Copy-paste error in the subject - the prefix should be:
mfd: da9062:


Best regards,
Krzysztof
