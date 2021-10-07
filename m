Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9CF242599E
	for <lists+linux-omap@lfdr.de>; Thu,  7 Oct 2021 19:37:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243307AbhJGRjl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 Oct 2021 13:39:41 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:36502
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242798AbhJGRjk (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 7 Oct 2021 13:39:40 -0400
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6910B3FFFC
        for <linux-omap@vger.kernel.org>; Thu,  7 Oct 2021 17:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633628264;
        bh=5flUaf6jKiDLWUPC8SE0c+myQU9KVt7aFY9IwB5v+1Y=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=m0nIQYzxzHZBsy7Q5pXii5iUojo1yyY5uXT88bFBevOjqU6rEyNxv38zZq/BnRPn7
         RGJLGzV0vIgzMo0FiW0ynHRc/V1s5L4RbPEOXeM+Q/LXPw+aMya+Y+aJsEstgoPSmR
         jE2sCmrylNTUiwdE6jaUB54CxpYZ/ANOdICbQkedfw+X+wZb6/BEowOp/+3/kjwcRN
         2aZnhgl7k8p7j5/nhami9KdqiCOf/xP3Pog/j3fJ8aZxQ/5irqIPhMDnspy8z+sva9
         n9MVpdMW2fHzvq32sp+1eGTA9T+jc047zgFH6T8UNQXe80lM2d1N9cnzc/bYnoHTn1
         IDc4JmzbmnjcQ==
Received: by mail-ed1-f70.google.com with SMTP id u17-20020a50d511000000b003daa3828c13so6600042edi.12
        for <linux-omap@vger.kernel.org>; Thu, 07 Oct 2021 10:37:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5flUaf6jKiDLWUPC8SE0c+myQU9KVt7aFY9IwB5v+1Y=;
        b=JH7B41cUGLOrK18iIugJWLKShm0+8C7QR6gh8XfBq8TmgVW9kaisap3NlkMLo3dSvL
         ox3gKAltT5xDfPz2zeXQ+MXdvgjtqh38HXymdZDf+aBJofN42SXWtgNV5w5I+StcrOuB
         qc/FBJCkeJqyLhBYDDAq8VhUTlBtcEBsrt+MHbTzTMlKW8figH29DK/lOAaAbcrY/V5a
         p4IKZOKy2/iNnEnp7pBH0pFpwxWqZNkse5yfF3CuqthinjBPuIT1Pdonq2oQ0Q8UA9tq
         EygLL6Q2WKnhU/a/JQdHW+xctOzo6E2sAf1xvtZWQIOZAszZ/NUYeR3qjpRkZzUAks3g
         0JAw==
X-Gm-Message-State: AOAM532aIzJo7mX40rY4fIlX7GEPhzl8zlyelYjesmpBtwwtrhDjGyEn
        WHBAyZfjYkDYDXbAur5fp6hzopH4gX1dgsZQc0gInYuI0wtAO0OGYTZeoQD+OzkLW2oUBVzt7Ww
        BWm6nnqoBSp48u8Tdr1R98K9Vtl/WkNGe+CcE7L8=
X-Received: by 2002:aa7:dbcf:: with SMTP id v15mr7948899edt.243.1633628264142;
        Thu, 07 Oct 2021 10:37:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxiw5fAi2srcOES1uBrM+2ioQHt4K41K6+prToUJlETyugFBx966hJWqDGKNiOpd+Zl4XJjVg==
X-Received: by 2002:aa7:dbcf:: with SMTP id v15mr7948871edt.243.1633628264021;
        Thu, 07 Oct 2021 10:37:44 -0700 (PDT)
Received: from [192.168.1.24] (xdsl-188-155-186-13.adslplus.ch. [188.155.186.13])
        by smtp.gmail.com with ESMTPSA id b5sm42732edu.13.2021.10.07.10.37.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Oct 2021 10:37:43 -0700 (PDT)
Subject: Re: [PATCH v5 0/8] dt-bindings: memory-controllers: ti,gpmc: Convert
 to yaml
To:     Roger Quadros <rogerq@kernel.org>, tony@atomide.com
Cc:     robh+dt@kernel.org, grygorii.strashko@ti.com, nm@ti.com,
        lokeshvutla@ti.com, nsekhar@ti.com, miquel.raynal@bootlin.com,
        devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211007120830.17221-1-rogerq@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <6b90a6fd-001f-a41a-b69f-2bd3ec8a8e26@canonical.com>
Date:   Thu, 7 Oct 2021 19:37:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211007120830.17221-1-rogerq@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 07/10/2021 14:08, Roger Quadros wrote:
> Hi,
> 
> This series converts ti,gpmc memory controller and ti,gpmc-nand and
> ti,gpmc-onenand MTD controller bindings to yaml.
> 
> cheers,
> -roger
> 

Hi,

Although you did not mention it here, it looks like you have some
dependencies between the patches. Maybe this shall go simply via Rob's tree?

Best regards,
Krzysztof
