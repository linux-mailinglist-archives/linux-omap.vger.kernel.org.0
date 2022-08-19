Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFB4F599BA2
	for <lists+linux-omap@lfdr.de>; Fri, 19 Aug 2022 14:17:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348851AbiHSMKn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 19 Aug 2022 08:10:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348957AbiHSMKi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 19 Aug 2022 08:10:38 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58DDE100974
        for <linux-omap@vger.kernel.org>; Fri, 19 Aug 2022 05:10:35 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id q7so2191000lfu.5
        for <linux-omap@vger.kernel.org>; Fri, 19 Aug 2022 05:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=/rotPRMyFykIXbEQjK1yUd9+5hjvfQMrFWg8nBVAqTs=;
        b=oiUXuGlaI6xH8x/UtF6sEDlcvS9Wm2oyxdF3yW8iJt0y3msfvBo/3BS3Fcqis1R+K5
         beIMVxWfWNYholJh/B/c8mN4oCAqKvULd7c7UEjZryzGmmuEK0GbnOV7Uijm7t3knQW4
         /it/nYVyovl/yGXcoYGIUOg4ANBqIaaQC+zGyPkNZx5/dfZfIWMQYy6GJwwVooRTcM2L
         l5Vj/Rj2HRRkqLLQ3RAMooDWdPNU8GEry/S3jD+3L/lNn8jxfVxcgV5+HWfx1YQyApOt
         AnNSHcNXhVVh4y6i1FMiEy/BobN5HWmSVfYOPfAhU1dsV+xsMWKMgWtwKA1ACijWq7RX
         bt2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=/rotPRMyFykIXbEQjK1yUd9+5hjvfQMrFWg8nBVAqTs=;
        b=rG/A03V/Uu0flZiKhhIsRqu5pWRhViBe0P+Qdg+Fbus5c82+888Kmhebw2pgi/TSdS
         adiU+bLsD+XCpRafUxJMUbaxsv4Hw/tJeZyvXeRCFKlRfRx6mMDt/4noAJEpnnRksSu1
         8ZUlmbb45O8VYW/48Baf4oGPZa4Jx4re5Yv/RhZBbYEa/biGm8NrSJU+o4x3u3Y25wlY
         FG9FsRruiED2UKY9XdNpqZBhh6Y2vLD1A3Gs/3CZlNxuDWAa5jCKtWIDNVVex9gruDeb
         pR+U3ljafzFUNHi3Wd0aqsjoCMPRXEfilpUyd/b6+LHLbIh1Y7YJ1BaNJVAzhDwAv0NP
         zR+g==
X-Gm-Message-State: ACgBeo23S8xJPNQ7c69CFhe/U731ph3PDPiqRuFfRnMWHh+LKcR/23zh
        81G504ublH3gOzgEWH1DAXptMw==
X-Google-Smtp-Source: AA6agR4syKwLDRqEuhqJddk4QS26uPNpz9B/eUtg2l9BcQgQO5jYJ+B4kFiw5IMXuFP8cBdjM9JcDg==
X-Received: by 2002:a05:6512:304c:b0:492:cd69:6cb8 with SMTP id b12-20020a056512304c00b00492cd696cb8mr719471lfb.551.1660911033961;
        Fri, 19 Aug 2022 05:10:33 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5? (d1xw6v77xrs23np8r6z-4.rev.dnainternet.fi. [2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5])
        by smtp.gmail.com with ESMTPSA id d11-20020a19384b000000b0048b0975ac7asm616002lfj.151.2022.08.19.05.10.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Aug 2022 05:10:33 -0700 (PDT)
Message-ID: <dc03a954-116d-2c41-e9b6-7404652c17af@linaro.org>
Date:   Fri, 19 Aug 2022 15:10:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 2/3] driver: input: matric-keypad: add reduced matrix
 support
Content-Language: en-US
To:     Gireesh.Hiremath@in.bosch.com, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org, bcousson@baylibre.com,
        tony@atomide.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, dmitry.torokhov@gmail.com,
        mkorpershoek@baylibre.com, davidgow@google.com,
        m.felsch@pengutronix.de, swboyd@chromium.org,
        fengping.yu@mediatek.com, y.oudjana@protonmail.com,
        rdunlap@infradead.org, colin.king@intel.com
Cc:     sjoerd.simons@collabora.co.uk, VinayKumar.Shettar@in.bosch.com,
        Govindaraji.Sivanantham@in.bosch.com, anaclaudia.dias@de.bosch.com
References: <20220819065946.9572-1-Gireesh.Hiremath@in.bosch.com>
 <20220819065946.9572-2-Gireesh.Hiremath@in.bosch.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220819065946.9572-2-Gireesh.Hiremath@in.bosch.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 19/08/2022 09:59, Gireesh.Hiremath@in.bosch.com wrote:
>  
>  	struct gpio_desc **row_gpios;
>  	struct gpio_desc **col_gpios;
> +	struct gpio_desc **desc_gpios;
>  
> -	unsigned int	num_row_gpios;
> -	unsigned int	num_col_gpios;
> +	unsigned int num_row_gpios;
> +	unsigned int num_col_gpios;

Do not mix up unrelated changes... One logical change, one commit.
Entire patch should be cleanup from this (it's not only here but in
several places). Except that you have build failures to fix...

Best regards,
Krzysztof
