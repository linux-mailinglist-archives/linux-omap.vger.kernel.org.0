Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42C69616459
	for <lists+linux-omap@lfdr.de>; Wed,  2 Nov 2022 15:04:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229485AbiKBOD7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 2 Nov 2022 10:03:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbiKBOD4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 2 Nov 2022 10:03:56 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3AA963B7
        for <linux-omap@vger.kernel.org>; Wed,  2 Nov 2022 07:03:54 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id c8so12490756qvn.10
        for <linux-omap@vger.kernel.org>; Wed, 02 Nov 2022 07:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pywIRCPuC2MFbuylTPqRj5zD/GzM0s7PD59oXY9A6TY=;
        b=Fv3BR0IWU6Mu64TYqH1aeAggacF0YoDIO1TF9/HD5YQsLgVwmeetHc2Q0UZJblS6vQ
         GdeznqYKMJJCwU36X7ujN2vVL/o+AnibDLoucDXu2nJou1ttPPuVk/73xQyQ1uEfjwe1
         Gcx5cM+VcnWwmC1r/74VgXk04nxgdicOLtEy5VwKo/4oLu5w7kkm81fSmZFehyrNmHKO
         CxYfIXX2XSJrr4Sv8dzqB4Q3XdMNCiTPmYBRO3uNhaLG09FK+hFTNfVd2wYdqD4aZXzr
         2wCq1cFMVRzMnNA9R/+zD0nFUZ/BdGY0itltb78MbFXAv79VzZOXltD7Ve4K3sFIPts2
         B0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pywIRCPuC2MFbuylTPqRj5zD/GzM0s7PD59oXY9A6TY=;
        b=KP4PpRe19j+dofmtBGLwL3d53wIC4L+0LEnAsLcW/PmnhF6KYltI7cT0p4LOo2+oUe
         zV4x6QDvDQgUf7MnCJX5eGw5kCM7h9hMnCIwyti5ygmBrzXetO6KUfvOWWO/QGitBWcQ
         ppc5R8ZMqOYg2qQCw8BOdxKOO8m8hXCUvIhktvprvUWmII71ko7P5JrBlKKtjKGC3yJK
         aDMRNQwttdb3VKmKdGJicLgEBtfcZASH0DCFx35j2i4f7GLYJwimuBuVC83NjSix8H7b
         paoepmLqrHjLTCYII1cYbU9hM6rO56/ySPihl5GWRJ8YHKm2lc2reG/u5V1ikWxtpB/X
         pwwA==
X-Gm-Message-State: ACrzQf3ww12s0E1sqCzFno/NmjFoRnTU6buBcN3gZFuAlFpcZG6OiFGK
        RXwaKN+KETjlpB0DVFllOB0FLTzahJuDhA==
X-Google-Smtp-Source: AMsMyM6VJAYZR7opShbPCFk8B4tgC5r7eMS47AqJmXIMeK1P1Z1U3UOf03hUYsPeHopf1Hl5a1e86Q==
X-Received: by 2002:a05:6214:1cc2:b0:4bb:c676:5bda with SMTP id g2-20020a0562141cc200b004bbc6765bdamr20120695qvd.0.1667397833691;
        Wed, 02 Nov 2022 07:03:53 -0700 (PDT)
Received: from krzk-bin.. ([2601:586:5000:570:28d9:4790:bc16:cc93])
        by smtp.gmail.com with ESMTPSA id bn5-20020a05620a2ac500b006bb78d095c5sm7533392qkb.79.2022.11.02.07.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 07:03:53 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        "B. Niedermayr" <benedikt.niedermayr@siemens.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        tony@atomide.com, rogerq@kernel.org, robh+dt@kernel.org
Subject: Re: [PATCH v9 0/2] gpmc wait pin additions
Date:   Wed,  2 Nov 2022 10:03:50 -0400
Message-Id: <166739782624.6087.4220604389047260115.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221102133047.1654449-1-benedikt.niedermayr@siemens.com>
References: <20221102133047.1654449-1-benedikt.niedermayr@siemens.com>
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

On Wed, 2 Nov 2022 14:30:45 +0100, B. Niedermayr wrote:
> From: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
> 
> Currently it is not possible to configure the WAIT0PINPOLARITY and
> WAIT1PINPOLARITY bits of the GPMC_CONFIG register directly via
> device tree properties.
> 
> It is also not possible to use the same wait-pin for different
> cs-regions.
> 
> [...]

Applied, thanks!

[1/2] memory: omap-gpmc: wait pin additions
      https://git.kernel.org/krzk/linux-mem-ctrl/c/89aed3cd5cb951113b766cddd9c2df43cfbdafd5
[2/2] dt-bindings: memory-controllers: gpmc-child: add wait-pin polarity
      https://git.kernel.org/krzk/linux-mem-ctrl/c/1f1e46b83b7db08c8db31816c857e27da84d4ca3

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
