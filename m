Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B6FF7867B7
	for <lists+linux-omap@lfdr.de>; Thu, 24 Aug 2023 08:47:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235604AbjHXGrP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 24 Aug 2023 02:47:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240221AbjHXGqe (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 24 Aug 2023 02:46:34 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 146601702
        for <linux-omap@vger.kernel.org>; Wed, 23 Aug 2023 23:46:24 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-522bd411679so7967917a12.0
        for <linux-omap@vger.kernel.org>; Wed, 23 Aug 2023 23:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692859582; x=1693464382;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oXR3CLIiBpyvmVut/UsFSeJ12pMtKuMLIAGEGf/cnUY=;
        b=sG93NB9Frtt3O2iyPXQ7pNypV6CrimUE/f9SueEl3Ja5LUQpFoLlab/HRnVgr0koMS
         8l+cfasEzC7LSWqNwEaVJlwlCJNEbxWGnEB1GonfR7rBa/+wE6Zzt6DvwIC7QNe+OA7m
         OGCUv6PbWjpADA05mIL7MNcrSOvmf8E4en0tShJi8yB/RYa8lks3egttsM3gdKVy1XnL
         NOolGMxkfz2V4QUbkMd4D1Wdg3e7Jsy76aNZevsAsRYNvfLnQtKuVImA3lCGa9qV457H
         PlZ7KeUfaVZvEKQYBzRG7g3r0sGcyHtS851lYoSQGYLl4+95HSlsWjn1kAMRbWoHxuH1
         GVdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692859582; x=1693464382;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oXR3CLIiBpyvmVut/UsFSeJ12pMtKuMLIAGEGf/cnUY=;
        b=EDfZNyE9eecpNf8RiPgqa/Er9O3k3AErSVoGiHmQ3Nor/m3mLEid78Lhjr9tVtZSvi
         p4IFANuzXe0pItoCKTaiPPgTqESl/gqDIvRsbuR+DCEq0amZFEL0liIKTVlQm+2pnPcI
         Mmby3SUNYMbPz0n7oCsMEeYL7RM1I5t8W9UEWSnmNlzCjdGCcOACZG3bmqXZt3+Via9h
         OuL09t2GLce2gHdofp3Xs7V7HodHenydWHPk3RCC6MKwevI+jXO9XByUj0N5ZEbNPSEg
         dfhntihLMipIYPWI94P/0GAgpzFe0Fkp4A5B3zG8dp4fE7SuWw7T83JrruZYQWB6uiel
         d/jg==
X-Gm-Message-State: AOJu0YwKxlkDbLThvk3nKjm2+Sj1lxhOHWa4Vr2mQGk+rE4vCOj55SeE
        RfZJtsrBfWAcVBETU6eG4U33FA==
X-Google-Smtp-Source: AGHT+IHJcELVd4pq2Oe8iCIJlVRhuMf1x1yH2JxW4qWladkF/S3emBT2Iv80j4TO2slzAIWzWh1eow==
X-Received: by 2002:aa7:c718:0:b0:52a:943:9abd with SMTP id i24-20020aa7c718000000b0052a09439abdmr9065547edq.30.1692859582450;
        Wed, 23 Aug 2023 23:46:22 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id r5-20020aa7cb85000000b0052348d74865sm10167643edt.61.2023.08.23.23.46.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Aug 2023 23:46:22 -0700 (PDT)
Message-ID: <ba603c1f-6f2c-6408-bc71-41aa0e7d4ee8@linaro.org>
Date:   Thu, 24 Aug 2023 08:46:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v6 3/5] net: ti: icss-iep: Add IEP driver
Content-Language: en-US
To:     MD Danish Anwar <danishanwar@ti.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Roger Quadros <rogerq@kernel.org>,
        Simon Horman <simon.horman@corigine.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Richard Cochran <richardcochran@gmail.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Eric Dumazet <edumazet@google.com>,
        "David S. Miller" <davem@davemloft.net>
Cc:     nm@ti.com, srk@ti.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230823113254.292603-1-danishanwar@ti.com>
 <20230823113254.292603-4-danishanwar@ti.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230823113254.292603-4-danishanwar@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 23/08/2023 13:32, MD Danish Anwar wrote:
> From: Roger Quadros <rogerq@ti.com>
> 
> Add a driver for Industrial Ethernet Peripheral (IEP) block of PRUSS to
> support timestamping of ethernet packets and thus support PTP and PPS
> for PRU ethernet ports.
> 
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> Reviewed-by: Roger Quadros <rogerq@kernel.org>
> Reviewed-by: Simon Horman <horms@kernel.org>

So more of the tags appear... And one of authors (Roger) also is
reviewer... I would be surprised if author did not approve own code.

What's happening here?

Best regards,
Krzysztof

