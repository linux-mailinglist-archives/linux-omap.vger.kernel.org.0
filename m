Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54C021BE17A
	for <lists+linux-omap@lfdr.de>; Wed, 29 Apr 2020 16:46:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726637AbgD2Oqh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 29 Apr 2020 10:46:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726618AbgD2Oqh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Wed, 29 Apr 2020 10:46:37 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71846C035493
        for <linux-omap@vger.kernel.org>; Wed, 29 Apr 2020 07:46:36 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id t14so2847504wrw.12
        for <linux-omap@vger.kernel.org>; Wed, 29 Apr 2020 07:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2Ficmofxvg1gGlcOqmwoo/4T3OdE1Nj+sekhSCfgbec=;
        b=cWGcfd37tz1qVZcYhvT2L/iBeU7Z9JdDjY+jlvkqguZEBWg21l9NQBbEhfqreAHF0r
         PgFOGOS0MuAq132t+zlontVtEyhwErfv+U75h8RTQVurtuURP+rNnNwItWYiPXCfrdHV
         M0aPXzhFltqtsifSRCoICBK9GZvlMeEtQqt6DgYTKdkeb+TpCnlNguP/Xv6wxhoFkJWG
         tYIBTK1lJVb2HjZCuOovIjkp1WTLPka/RHm4hD0HC20Zoy212oEIgR2awZtUMzR5c3XI
         aUTxaOZ4iJXDWIUI8OQS8pHpNV8iVSsHW2+ZUV3oVUJIGte4ATKKW/APRmdqMVeu/1Br
         eN5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2Ficmofxvg1gGlcOqmwoo/4T3OdE1Nj+sekhSCfgbec=;
        b=YbI8Yg1IE0AVnrvHo336PeQAWiHyq2UTUSXjKx931ls3f3w6rj3e6esyC1gtflRP/m
         lkyOQvJw7K0qHdUONR4pIF5wKPuWARvpiMGiD6v4PRZgTU1dfoqviliiGQYNhQDBK0mx
         TGQp7gw4vI+7BySidYuDkTQVbTRgPtO+5Hd93y31tsqwfIYUx9EINh7OnemjBkjnw2oR
         zLnugdfkfIhNq6ulzU/7aSqaSqBl18A/bYikWNIYjnNM5fCDLnHvh1pnDuxcOQTIbM5F
         eOb+ZtWAMx4L2IQlyoZm0CXLpASGjfJYm4dIQ4IGGO/Pm9qLNDwyQAKg/Oh1fP9wbP5P
         zvSQ==
X-Gm-Message-State: AGi0PuaKTR83IxLlzM+uzdXz50J2NFab2rOvubapJhommb/Pai1AEDde
        IgfETSKkMJH5hIMB14VcIfrnWm6JHlA=
X-Google-Smtp-Source: APiQypIJBdvXFYtYk7flefaHVSe/KkfD3c1Yp1Mc7/t3OCPyBa7dFoaFaqO6BQHC4L0I7gFa541a+w==
X-Received: by 2002:a5d:69c9:: with SMTP id s9mr39673966wrw.307.1588171594821;
        Wed, 29 Apr 2020 07:46:34 -0700 (PDT)
Received: from [192.168.0.41] (lns-bzn-59-82-252-135-148.adsl.proxad.net. [82.252.135.148])
        by smtp.googlemail.com with ESMTPSA id a9sm7675575wmm.38.2020.04.29.07.46.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2020 07:46:34 -0700 (PDT)
Subject: Re: [PATCH v2] thermal: ti-soc-thermal: avoid dereferencing ERR_PTR
To:     Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Keerthy <j-keerthy@ti.com>, Zhang Rui <rui.zhang@intel.com>,
        Amit Kucheria <amit.kucheria@verdurent.com>
Cc:     linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-omap@vger.kernel.org
References: <20200424161944.6044-1-sudipm.mukherjee@gmail.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <6255085b-984b-58b1-69e7-81c3b9cf1fc7@linaro.org>
Date:   Wed, 29 Apr 2020 16:46:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200424161944.6044-1-sudipm.mukherjee@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 24/04/2020 18:19, Sudip Mukherjee wrote:
> On error the function ti_bandgap_get_sensor_data() returns the error
> code in ERR_PTR() but we only checked if the return value is NULL or
> not. And, so we can dereference an error code inside ERR_PTR.
> While at it, convert a check to IS_ERR_OR_NULL.
> 
> Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> ---

Applied thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
