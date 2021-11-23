Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F5C745ACBF
	for <lists+linux-omap@lfdr.de>; Tue, 23 Nov 2021 20:43:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238809AbhKWTrE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 23 Nov 2021 14:47:04 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:34580
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238547AbhKWTrD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Tue, 23 Nov 2021 14:47:03 -0500
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 79FF140746
        for <linux-omap@vger.kernel.org>; Tue, 23 Nov 2021 19:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1637696634;
        bh=X9nPu6M4MnGefRZgRydbBLcoxEN2an8Y7q8i1bd1GgY=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=D8bhrCEb54Ptj/jszwGK3G055/akajeVAAG/5P5NnjKYaxW6ar8hzh+6VUHpZn64v
         NJmLomc+OUKRXAURHYtBjXftV0oLhSTHzDPEHYnyw0SPvufi2fazUZGn15tndOEgSW
         CTA66G1nqSn2U6d484+tHixHCW2tLC55EPEce2PZyU13nDZrthRoofdymTWmAMKazw
         JEZRVZA1MaP51vCGcu44l8iZjHG26sut7Vfz1yMLyYiPER8YAOE8bD7sqOGjz+9gL+
         GG/VHwSSRPNTyz2l8WgQByukHibK/WLJGDwJ1HgmVTiAdv1b6PbAqIICTi48oVSixE
         INQOYhORa5Qig==
Received: by mail-lj1-f199.google.com with SMTP id t25-20020a2e8e79000000b0021b5c659213so69402ljk.10
        for <linux-omap@vger.kernel.org>; Tue, 23 Nov 2021 11:43:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=X9nPu6M4MnGefRZgRydbBLcoxEN2an8Y7q8i1bd1GgY=;
        b=chnNCF+p5qhuDD2PSmMlt5fnaC43OjDlwfYTrpHJlBMr8LMdcXr0ZlIq2DklPdM+VP
         7wL3AjdpnwQp264LEY3kv6GpdS/dYhvSpF3HpHzcP8GaSHWowxzD3ooThSMr3q+9JXwu
         ceGF+OC/foNrOyrIucQI3CWKIvmjuNH4sg5W88ypLmUdq7u8BIGKaPWXPs1umsTGpaJt
         JR3FtSJ3YmZBPImI/oFc0TJ1nAVaXtoZf8/zrxMVTKxpvj1tjFL5xGbbRcYF2chdNeTI
         A3IDLHXgglv2j+BBGbehkRv41DnG0qdT55b9fZH3VcBF3+fxyIitYkyK5aYAobymaKlY
         1BZQ==
X-Gm-Message-State: AOAM530M8qaaYmxHktP9pEf/9fAMsgoCO+cUcRYCojSHTgG0AY4LbOHJ
        3WKGqASg5MnCK8ZPNne+gEvOzlIYTr5JVh86X02dG0fS8hB8I0ecicugLp8lD6gElFDo6I9MVk2
        RxnGba6eNGNf/qm+WBA34zFZxVc032DMXQc0LlgU=
X-Received: by 2002:a19:f242:: with SMTP id d2mr7801922lfk.516.1637696633485;
        Tue, 23 Nov 2021 11:43:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxFaBRKZmEoS9PRHvnxswXTWeitqkbEItlmIJMyGoqfOpgMWayVxNDGVMByx8TFop12tJI2zw==
X-Received: by 2002:a19:f242:: with SMTP id d2mr7801899lfk.516.1637696633321;
        Tue, 23 Nov 2021 11:43:53 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id r3sm1387507lfc.114.2021.11.23.11.43.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Nov 2021 11:43:52 -0800 (PST)
Message-ID: <6a8f93a4-7390-1f1e-6ba0-601859c21ac0@canonical.com>
Date:   Tue, 23 Nov 2021 20:43:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 2/4] memory: omap-gpmc: Fix menuconfig visibility
Content-Language: en-US
To:     Roger Quadros <rogerq@kernel.org>, tony@atomide.com
Cc:     kishon@ti.com, nm@ti.com, vigneshr@ti.com,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20211123102607.13002-1-rogerq@kernel.org>
 <20211123102607.13002-4-rogerq@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211123102607.13002-4-rogerq@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 23/11/2021 11:26, Roger Quadros wrote:
> GPMC was not being visible if COMPILE_TEST is not enabled.
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> ---
>  drivers/memory/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

... which was probably on purpose, similarly to many other SoC drivers
which are selected by platform. Therefore there is no bug to fix here -
lack of visibility is not a problem. Please document instead why you
want to change it, e.g. why this is a problem or unwanted behavior.

Best regards,
Krzysztof
