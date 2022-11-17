Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCE8F62E0A5
	for <lists+linux-omap@lfdr.de>; Thu, 17 Nov 2022 17:00:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240043AbiKQQAt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 17 Nov 2022 11:00:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239956AbiKQQAo (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 17 Nov 2022 11:00:44 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 976D07019E
        for <linux-omap@vger.kernel.org>; Thu, 17 Nov 2022 08:00:40 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id s196so2357600pgs.3
        for <linux-omap@vger.kernel.org>; Thu, 17 Nov 2022 08:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=WeXWqGLnMnk6uS6XkKZbr/nN6eSE9M6SqY0Ycssq4Dg=;
        b=PUS4jdB+kqWabwXwuFg3VjIMIsjSVWnik9vZDbsjJ3S1YGa1A0mdY4EFcfp/b6wuGh
         Ie1KuTrSGuy3q5hBbBuzlvOccif2bvxxDOc9HUdwaZGkJ/m1FCTNU/F/Lwur7sySFogt
         7bsxtUyXBWZEloqP4EJfIpcUMlwYfpoUG1U809+jrJJz0lEvRuALyH5zjAtAFay7O06m
         C0sXM/5WIRNwcqda38DQy0Nt3Q4fXMJW7YCBbgJnJZq7O8oHh+X9nOiCXqBLFBWm5A5l
         nyTMBLMX3J4q2JJRtZPFlaefYqgthHcxCByWo2u+7v+ulBnCHcFiehT/7c9oJxUU6F38
         ykBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WeXWqGLnMnk6uS6XkKZbr/nN6eSE9M6SqY0Ycssq4Dg=;
        b=YXnAO24bPEGpqvzZTyLpjiB6QBITBpT4cs+0EpGLJRbRm0Jvdr/bV0GmTSOjBvSCvV
         mzuQrSF2JPUkhwNes2Yi2IfOx4vvKhXG++GKf7sTFMAOwu36X7MYBlaNLZS//ObUWfHt
         GN1CbOE3CrCqSSHHz0d/qrMopxI5MkPMmoHYTTkeRC3DDQ0vQmFYHE18hT3DK4KnWS5c
         yL7+f2GnCBzcXnMr1LXCn5QjNy5U6qUamZhBIaV/icDMlcegMSoT7j/crg6RF+JozZnO
         EIDehEHotluaH8j1UDsA5w5m3Cc9jj6dKXqi1QIG3Ch4PbVEw4+iQpUTZ6kLAR8ehK0L
         tG9w==
X-Gm-Message-State: ANoB5pkXE8Twy73NT7FhCQ31F1RasYVZX2WxfcyatRjhuk+++gQW9hSy
        nGdZuv6WssvrzBJeAfYEF5/XIQ==
X-Google-Smtp-Source: AA0mqf6xLyDPJpFM5ANLVXCIXp6GJqaL+20inLmVRY8uVTrkvctosjsvdu8xHT0YU5iw6N0lZNtYZw==
X-Received: by 2002:a05:6a00:f92:b0:562:317c:2a8 with SMTP id ct18-20020a056a000f9200b00562317c02a8mr3664989pfb.49.1668700840241;
        Thu, 17 Nov 2022 08:00:40 -0800 (PST)
Received: from localhost ([75.172.139.56])
        by smtp.gmail.com with ESMTPSA id 8-20020a17090a004800b0020ae09e9724sm1040623pjb.53.2022.11.17.08.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 08:00:39 -0800 (PST)
From:   Kevin Hilman <khilman@baylibre.com>
To:     soc@kernel.org, Jerome Neanne <jneanne@baylibre.com>,
        lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        nm@ti.com, kristo@kernel.org, dmitry.torokhov@gmail.com,
        krzysztof.kozlowski+dt@linaro.org, catalin.marinas@arm.com,
        will@kernel.org, lee@kernel.org, tony@atomide.com, vigneshr@ti.com,
        shawnguo@kernel.org, geert+renesas@glider.be,
        dmitry.baryshkov@linaro.org, marcel.ziswiler@toradex.com,
        vkoul@kernel.org, biju.das.jz@bp.renesas.com, arnd@arndb.de,
        jeff@labundy.com
Cc:     afd@ti.com, narmstrong@baylibre.com, msp@baylibre.com,
        j-keerthy@ti.com, jneanne@baylibre.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH v7 6/6] arm64: defconfig: Add tps65219 as modules
In-Reply-To: <7h5yffamcf.fsf@baylibre.com>
References: <20221104152311.1098603-1-jneanne@baylibre.com>
 <20221104152311.1098603-7-jneanne@baylibre.com>
 <7h5yffamcf.fsf@baylibre.com>
Date:   Thu, 17 Nov 2022 08:00:37 -0800
Message-ID: <7hfsehbmfu.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Arnd, Olof,

Kevin Hilman <khilman@baylibre.com> writes:

> Jerome Neanne <jneanne@baylibre.com> writes:
>
>> Development boards from TI: SK-AM64 PROC1004 include the TPS65219 PMIC.
>> Add support for the TPS65219 PMIC by enabling MFD, regulator and
>> power-button drivers.  All drivers enabled as modules.
>>
>> Signed-off-by: Jerome Neanne <jneanne@baylibre.com>
>> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
>
> Reviewed-by: Kevin Hilman <khilman@baylibre.com>

Could you pick this one up via the soc tree?  The mfd & input parts have
been applied.

In case you don't have the full series in your inbox, it's here:
https://lore.kernel.org/r/20221104152311.1098603-1-jneanne@baylibre.com

Thanks,

Kevin

