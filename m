Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D523623E5E
	for <lists+linux-omap@lfdr.de>; Thu, 10 Nov 2022 10:14:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229747AbiKJJOz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Nov 2022 04:14:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229754AbiKJJOv (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 10 Nov 2022 04:14:51 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9172D682B3
        for <linux-omap@vger.kernel.org>; Thu, 10 Nov 2022 01:14:50 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id b3so2026049lfv.2
        for <linux-omap@vger.kernel.org>; Thu, 10 Nov 2022 01:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aWtnQJaZ/DC2sr1Ii69yeGSZuxu9g3YJF6gE4/PvhMI=;
        b=IyqPqR2HfrTjYWOP26a2uWXKScvs+iwrE2hWCYZOtcqow8xOBNXqf+yqpdAcyAihQD
         anjFfES39Wc3rbVkiYr0dw8tXWiORSEIB6LB9Av6KxIEIIXU8aKRczr4YeFLum9y2JXS
         zR+e2d+V6AWcV+qKg+Rsd23WST+VtCuejCJKGoVajT+GlAvyZ54/WoncChoty4k7JwZx
         T7KnMY30EKzqIw7EAvu2ok1Y/jy8etdvMRJO0/26JnkksiPCkOcqCX6z3rksL41BndP+
         PG+MEcDeEQetWgTjFZrzyHdRi1CetcvMt7QblGBfLIopVkr+IKtEmyt8TAT/F0Mzbmg2
         p9Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aWtnQJaZ/DC2sr1Ii69yeGSZuxu9g3YJF6gE4/PvhMI=;
        b=t4k1YBy/T0xPM23wzg5n+sqlxSv0GcSkYbzdtRN7fcOKNa57JuNIyhSMt5YAvC7Md+
         a13sgRcJkBBN2oJrJteKNg7oALNUsZV8cr2GfH/ZMY1nQNdLwaPtexmqlwGr6rQV8bnX
         v/zDqquv+C8+qPbLLFlgBAEJbDEm7P1G5kwfrjlwX6izl/yVVNIfWmZjWyTdtoN8qdBP
         KWWsF0xC6gxy+2QR6nqjF1Hb92ICSzdkFYu60yMwHzr+4lPYT8bzB5XV53Muth43b0Dn
         T+E9u/ov7Nw8Ibd93KsO4x03q23xna7WlKlYg9AnqL+aILJeSf5NZWEXjkidM+ceJrSv
         IEQQ==
X-Gm-Message-State: ACrzQf0Xyz2h/sGiD7nPqBs0nbCHqg3zdji5lcJli+gjiWHxEB7O8mIL
        K+t2Rvuio5JbEGerPfBTl3WpFg==
X-Google-Smtp-Source: AMsMyM5SWvMuCZ7I789cGHR6D4TMVXQwi09H6ESZ3ij9ZsmEcuca6j39FFLlvqiJP0mflZ0jTY7LuA==
X-Received: by 2002:a05:6512:22d4:b0:4af:1f59:b6d0 with SMTP id g20-20020a05651222d400b004af1f59b6d0mr1294867lfu.314.1668071688997;
        Thu, 10 Nov 2022 01:14:48 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id m3-20020a0565120a8300b00492dbf809e8sm2663338lfu.118.2022.11.10.01.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 01:14:48 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     "B. Niedermayr" <benedikt.niedermayr@siemens.com>,
        linux-next@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-hardening@vger.kernel.org, gustavo@embeddedor.com,
        keescook@chromium.org, linux-kernel@vger.kernel.org,
        rogerq@kernel.org, tony@atomide.com, linux-omap@vger.kernel.org
Subject: Re: [PATCH] memory: omap-gpmc: fix coverity issue "Control flow issues"
Date:   Thu, 10 Nov 2022 10:14:47 +0100
Message-Id: <166807168409.17460.1069653454790290049.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221109102454.174320-1-benedikt.niedermayr@siemens.com>
References: <20221109102454.174320-1-benedikt.niedermayr@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, 9 Nov 2022 11:24:54 +0100, B. Niedermayr wrote:
> From: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
> 
> Assign a big positive integer instead of an negative integer to an
> u32 variable. Also remove the check for ">= 0" which doesn't make sense
> for unsigned integers.
> 
> 
> [...]

Applied, thanks!

[1/1] memory: omap-gpmc: fix coverity issue "Control flow issues"
      https://git.kernel.org/krzk/linux-mem-ctrl/c/10913c3c59ce04562230eee4a9d1b0d4e2808842

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
