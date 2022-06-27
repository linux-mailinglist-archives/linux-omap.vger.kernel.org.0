Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD2F855C6FE
	for <lists+linux-omap@lfdr.de>; Tue, 28 Jun 2022 14:53:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233814AbiF0JQU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 27 Jun 2022 05:16:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233430AbiF0JQN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 27 Jun 2022 05:16:13 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFCAF5590
        for <linux-omap@vger.kernel.org>; Mon, 27 Jun 2022 02:16:11 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id mf9so17890361ejb.0
        for <linux-omap@vger.kernel.org>; Mon, 27 Jun 2022 02:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=r+10y73o1BlNJF4WUvITZIfLalgDbNqsds0+u16dD8k=;
        b=DicwTKV87HX1b2VwlyEDHhg3G92yZFYVbjdox8Ym61HX63HfvQpst/3EoNW6U9xRPM
         4Yu+AJ6Pj40mAVN2l/Ph05zkEhHY1Nv+QxEEAgb85l8DHoUn1bCKx5G4iLJ1Zkv/Olnv
         06VCZOFs9e6LNmQ59XnzgW3CndZyMj4JukJ7+/14QByLaisb1b0PKgYpMv/Pksr1dQ5t
         qArhbUkRWZ48dU8aDy+pBXP8AnwVOtizrcnazgi1+dUUVmgSWXRCO2iAVVHooS0akgVM
         LXhaReUxOugOtGrgvDldNCh5Q04m2HbcfbImD+vIAG0Uv0xWTwjgFsdUWdVyl3HifXXR
         mGyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r+10y73o1BlNJF4WUvITZIfLalgDbNqsds0+u16dD8k=;
        b=3HrBjR6/7f7V7Pr/e6UhCV88/NsUcYAzmBMUYXSs2m+4MEw64x+1PwQMPQFa4R90GU
         F+ZFnWMEJkMwLHCWZmn1h0WLGX7bevgB7sXi/MaOaAwA/lUgXjPAvnWwZfoyV7kzWohO
         W0kWT1P4rkJePam3tmmbWQGabquQ8IG9Qn3aofSXY7eOP+IuXaAIp5UM9oI6CTYGOQyh
         Z+2TeZhUTjdmt4R5cxIpzWrw91BG4pzwzSXjgKufLOAbwxroMtyHetUcGqzh0MLz8V4S
         flS9qJ31UdEQkiGERWcH9bNXvJk3LQ5CxwXRt4fIrs8sJie3pCo99GlrYkykSFducafJ
         dHvA==
X-Gm-Message-State: AJIora9nFcYKQIBRfCY/Hk01Fc305iRSoex/uyhQSGGQflV2TYkcAl8D
        YnmDlMVL9QK+T0nRqiPT2ys54Q==
X-Google-Smtp-Source: AGRyM1uJKt77ujhXY8C3Qv1IH9qJa1kIEBOAMSFnKXQP0cMKiWlYx0QyySFAR6ZdVoQHLMvpZ8gNSQ==
X-Received: by 2002:a17:906:5d07:b0:722:e1e3:ab6b with SMTP id g7-20020a1709065d0700b00722e1e3ab6bmr12086465ejt.674.1656321371160;
        Mon, 27 Jun 2022 02:16:11 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id gy10-20020a170906f24a00b006f3ef214e2csm4805395ejb.146.2022.06.27.02.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 02:16:10 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     soc@kernel.org, linux-arm-kernel@lists.infradead.org,
        tony@atomide.com, linux-omap@vger.kernel.org, eballetbo@gmail.com,
        bcousson@baylibre.com, linux-kernel@vger.kernel.org,
        krzysztof.kozlowski@linaro.org, Arnd Bergmann <arnd@arndb.de>,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        arm@kernel.org, javier@dowhile0.org, robh+dt@kernel.org,
        olof@lixom.net
Subject: Re: [PATCH] ARM: dts: omap: adjust whitespace around '='
Date:   Mon, 27 Jun 2022 11:15:46 +0200
Message-Id: <165632135504.81841.12609886451846241256.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220526204044.831656-1-krzysztof.kozlowski@linaro.org>
References: <20220526204044.831656-1-krzysztof.kozlowski@linaro.org>
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

On Thu, 26 May 2022 22:40:44 +0200, Krzysztof Kozlowski wrote:
> Fix whitespace coding style: use single space instead of tabs or
> multiple spaces around '=' sign in property assignment.  No functional
> changes (same DTB).
> 
> 

Applied, thanks!

[1/1] ARM: dts: omap: adjust whitespace around '='
      https://git.kernel.org/krzk/linux/c/eef3af89b6b66ad61df636464ce92f5deabbc4a4

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
