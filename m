Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F7E27ACB8B
	for <lists+linux-omap@lfdr.de>; Sun, 24 Sep 2023 21:02:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230090AbjIXTCg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 24 Sep 2023 15:02:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229997AbjIXTC2 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 24 Sep 2023 15:02:28 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67837FB
        for <linux-omap@vger.kernel.org>; Sun, 24 Sep 2023 12:02:22 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-405524e6769so15855425e9.1
        for <linux-omap@vger.kernel.org>; Sun, 24 Sep 2023 12:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695582141; x=1696186941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SWFO82OJRYgOOb4Wcic+eTuDC/ArVTubTGTDywYSbzc=;
        b=EQTvLB4/KPMaNDnSHZOBXt6alw8iLa1iSxGyVnRDvsIPP/3mke9g15fmL4yYsZLb2x
         KujetD6l0jtCSj6YfdaQGGslHfUFsDQyxb/lp+BqmlWsYp/7fSlIGQ6AE+7mZ+9WZcPu
         W7r9U+RLRziR0AS0LjqDKq81CzIjAf0a3KsR9GDx35cIubnXJV/lVZ3zC6hsaeDdXagk
         hY2KClfCL8hyrAvYlS+Ja+b6iXwVjYwy+exrP/ra6o4LIdzu3/akxijAUeTtw9SLzCp9
         nvUj7ZuGg64yMhKhe1rZ5K/kPSaCKosaF+UkOcNwpU/raKHVKEYCqOCijZLgLR64bctY
         cpXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695582141; x=1696186941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SWFO82OJRYgOOb4Wcic+eTuDC/ArVTubTGTDywYSbzc=;
        b=Wp7t5uySzUpdD9UEMAQQbiDHyrYbxqo26OlNYkNmFc0CwjeUVX4B0b4gKXB0zTkSjP
         sEyXog/9m2U1qY9n+tlWzwUPzkRgt+Y0h37HlPjfHQ7kWVO8o3M5Ix3oHvLJwU6W76s0
         4dcUaJlQQcszI8MgpZeukUA2pne7/HhCs6dsCPaVd0xx/3ohddoPulCxPbSfEYTouAht
         ENe6b09qn5bYW/U0EDNHWK2Zv37W35J3igP7pUBFCXT70eBA5qfr7T36naih+pzXlAoe
         wflf5bzaUAMLCiwCk8VfH5SByZOJ/JwLHVPGKj49uoEtXpzDdaXveaFMcFeF5YRh3FZu
         QCuw==
X-Gm-Message-State: AOJu0YziqjOhYh54mNRO7cVD8JVrvQuZ5L6JNFcobwbN4eOXAdyaF4k4
        Hc3yRgSrU3iL1ljwSd/I+/qC2w==
X-Google-Smtp-Source: AGHT+IGvIpya5xYZx8UP+clOr5taqAlEPDk6qq95Fp3D28P19k6rc0DjSP2/4NtsuZPojlLQeISVcA==
X-Received: by 2002:a7b:ca4e:0:b0:405:3924:3cad with SMTP id m14-20020a7bca4e000000b0040539243cadmr4096134wml.15.1695582140804;
        Sun, 24 Sep 2023 12:02:20 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.100])
        by smtp.gmail.com with ESMTPSA id v2-20020a1cf702000000b003feae747ff2sm12980507wmh.35.2023.09.24.12.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Sep 2023 12:02:20 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ARM: dts: omap3-devkit8000: correct ethernet reg addresses (split)
Date:   Sun, 24 Sep 2023 21:02:06 +0200
Message-Id: <169558197844.54884.5866852884871225928.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230713152913.82846-1-krzysztof.kozlowski@linaro.org>
References: <20230713152913.82846-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


On Thu, 13 Jul 2023 17:29:13 +0200, Krzysztof Kozlowski wrote:
> The davicom,dm9000 Ethernet Controller accepts two reg addresses.
> 
> 

Patches were waiting long enough on the lists. I assume there are no objections,
at least none were shared, and this just slipped through the cracks. I applied
to my tree for further soc pull request, but if anyone wants to take it
instead, let me know.

Applied, thanks!

[1/1] ARM: dts: omap3-devkit8000: correct ethernet reg addresses (split)
      https://git.kernel.org/krzk/linux-dt/c/33d6227fcd1a8b68bf8d5e68f69a931dc87eac81

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
