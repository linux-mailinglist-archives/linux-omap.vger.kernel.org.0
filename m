Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC4D355C168
	for <lists+linux-omap@lfdr.de>; Tue, 28 Jun 2022 14:45:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233833AbiF0JQk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 27 Jun 2022 05:16:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231282AbiF0JQ3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 27 Jun 2022 05:16:29 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CCF262C8
        for <linux-omap@vger.kernel.org>; Mon, 27 Jun 2022 02:16:24 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id o10so12075744edi.1
        for <linux-omap@vger.kernel.org>; Mon, 27 Jun 2022 02:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=NHgGW5edOR2CgTMI2Iq9qtcnI3kzpEo3OIucbrYS0j4=;
        b=bbdj0sGZygZ1i3i9rc/6f6PRYHhFHR7Fh4ajnfc74Ga0xBST4p9hU1Oj2pdmYQg/F4
         jwqP85bNgxlA/996u7fSL9v6NKQ8Rgr3s2hye8H3/HLkSt7V9S8CvKr4THM8+HjJQv14
         fVUKyeKy32NpHGiWbCJ34CfZPxv5pCISGJxDJjWcbn4OcS6TbgTkUzQj4KZJ462q5NLX
         IMaefnFvImUqRmZaNrJeChnNbddWxUnO4FdCLcG0Na4f6KEHbpGRU74GYOgGPY1WGdIl
         FhA+QUozJI2vuJagSTb6gB9c7VMsVe9qVRf9OCbWQ+TaApzmmu+PCNslxMEJhTm1iJHb
         tNDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NHgGW5edOR2CgTMI2Iq9qtcnI3kzpEo3OIucbrYS0j4=;
        b=rpD4fhRrzT6MTc9fuhDa34rZsS5+6/i3FAMk6N+Z9vmTy7F0dH7SkYvlxRBXy1oIsG
         d6aTNQze5C36oYosoPF/gGV9VU517+Tc2GcR+KukUrpoBrOyc3C7R/h7XPxUuoR6lcO9
         lhfbx/Alwlx+XfXfjfVPUcI5RFWN0RGsWYwC/kxXmButD1U0k0VNuRODNqQ4R+a4/OMu
         97AWatose1Xdlv+vJGSPSt0xTRajnTQHrANFuAWTJJsFz6LtUKrnQg3G8AWFvswrbLkw
         scrw5cWVo8GiaRD4PFlSIBlDj/9n+DJoPppH0dg66SGLVZU7E8KO2BdK02rKZQGWn0tB
         Wn1Q==
X-Gm-Message-State: AJIora/nnzoYoqWepZLV+nxt/8XoQhadkF+IzguQAxx2WHqOcKhxo0eg
        vbohTPeY7nahbDe/j7oyQC9RAg==
X-Google-Smtp-Source: AGRyM1smXEMqtUlES9A9cuuQUJna0IWCyJPA214I44tZM6cHanCEhB/oj1VRKSoH04d7t5gR07LvLQ==
X-Received: by 2002:a05:6402:2554:b0:435:a3fb:9ab4 with SMTP id l20-20020a056402255400b00435a3fb9ab4mr15118091edb.5.1656321382890;
        Mon, 27 Jun 2022 02:16:22 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id gy10-20020a170906f24a00b006f3ef214e2csm4805395ejb.146.2022.06.27.02.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 02:16:22 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     soc@kernel.org, tony@atomide.com, linux-omap@vger.kernel.org,
        bcousson@baylibre.com, linux-kernel@vger.kernel.org,
        krzysztof.kozlowski@linaro.org, Arnd Bergmann <arnd@arndb.de>,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        arm@kernel.org, robh+dt@kernel.org, olof@lixom.net
Subject: Re: (subset) [PATCH v3 32/40] ARM: dts: omap: align gpio-key node names with dtschema
Date:   Mon, 27 Jun 2022 11:15:56 +0200
Message-Id: <165632135505.81841.7728354247662450860.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005333.18491-32-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org> <20220616005333.18491-32-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, 15 Jun 2022 17:53:25 -0700, Krzysztof Kozlowski wrote:
> The node names should be generic and DT schema expects certain pattern
> (e.g. with key/button/switch).
> 
> 

Applied, thanks!

[32/40] ARM: dts: omap: align gpio-key node names with dtschema
        https://git.kernel.org/krzk/linux/c/b1c9af5fec442b164849dc6802ec3bdb4b0c4768

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
