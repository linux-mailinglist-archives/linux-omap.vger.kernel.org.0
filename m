Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61C0A62F04B
	for <lists+linux-omap@lfdr.de>; Fri, 18 Nov 2022 09:59:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241510AbiKRI7P (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Nov 2022 03:59:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241652AbiKRI7K (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 18 Nov 2022 03:59:10 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A9E3716EE
        for <linux-omap@vger.kernel.org>; Fri, 18 Nov 2022 00:59:09 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id u2so5984938ljl.3
        for <linux-omap@vger.kernel.org>; Fri, 18 Nov 2022 00:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vMN/9sEQX+oWMMzW8abJ0SJZxuiiHW/kPCa03WIfkV4=;
        b=vSvA2NaRQMqCjEjXuWwOMCO85f839ADtrg+Td5rWtRv/ZYdc7ZYLkjszheJD4q/EDW
         cHhvIdNbSQtKJqzwgpzViJJ4ABsU8daGg6d3+fV+mAJSEQgshARHthtdVadsE7//NG/4
         pbFKbm2V9ZfitbDhbNRdsa2beH0PWAdE7HxA3XBUtU2yOnZMHpx6lUwiaR2eU7Cqt+Yj
         G1FtihPYwUll7xgI21Qi54jb4OiR4RQ+TZgfiY/sRVYMCQyCV0+bgP1hjeb0oVeLdJYe
         ohlQst+0HhRTcSvGBvTOXOlIJH64v9CoLRSlm9Brm4t/8zeFt3eZnxveGf0VE4Vbm4mt
         /2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vMN/9sEQX+oWMMzW8abJ0SJZxuiiHW/kPCa03WIfkV4=;
        b=I+Xm8YNMfa6F6eo56Hrjfr8+cqmYvwgAanQyh6/B/cTrblwKXzIKFgJXWm0KJNspf7
         ki3wDcB7fsTbEY+e8SnYCsO3oD27gSP3PfUycSGvteGpxhhBLah44b+hTtOu1UIovhZl
         RnFTNEiUOdBH0mk4pAhJL/Vvk9KaSeq4kfQbvYBO1Ua4hfvtTysG3i2wRJerQNSKoFIi
         RRkka/kEZA67imslYcUih+eY/nPUXN2jC7vdtEJSnwRLXVQ2J6AmoX5rkFEQP83iqc35
         2zE1Ugy1bCXhJ8H7QZMh+PuWZ5Gv20aKd208cNDbgygMh0URlJo8NscVQT4mVgdbcttG
         twkg==
X-Gm-Message-State: ANoB5pnhDjnyI0lMGxoUepFH+RNTF1FQz7lRjZxT3g2j9sXLvTS0OzJ0
        vBt+0DYCrRQWT7iitR5rRCDWTg==
X-Google-Smtp-Source: AA0mqf783Mk8tKoS0PODo05goGZKcGYAxRMHa0mnzuBCHVM4wJt2xwleBEsIJ85UMOywA2udTJ4XLA==
X-Received: by 2002:a05:651c:1721:b0:277:2600:9ce1 with SMTP id be33-20020a05651c172100b0027726009ce1mr2342179ljb.233.1668761947606;
        Fri, 18 Nov 2022 00:59:07 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id o6-20020a05651205c600b0049478cc4eb9sm575398lfo.230.2022.11.18.00.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 00:59:07 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] ARM: dts: omap: trim addresses to 8 digits
Date:   Fri, 18 Nov 2022 09:59:02 +0100
Message-Id: <166876193952.14422.13932375810534541913.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221115105053.95430-1-krzysztof.kozlowski@linaro.org>
References: <20221115105053.95430-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, 15 Nov 2022 11:50:53 +0100, Krzysztof Kozlowski wrote:
> Hex numbers in addresses and sizes should be rather eight digits, not
> nine.  Drop leading zeros.  No functional change (same DTB).
> 
> 

Applied, thanks!

[1/1] ARM: dts: omap: trim addresses to 8 digits
      https://git.kernel.org/krzk/linux-dt/c/2bb0f35ab02a226400122a109633042076e1dd26

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
