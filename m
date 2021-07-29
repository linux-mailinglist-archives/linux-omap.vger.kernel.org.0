Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22D113D9F33
	for <lists+linux-omap@lfdr.de>; Thu, 29 Jul 2021 10:09:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234673AbhG2IJH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 29 Jul 2021 04:09:07 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:51956
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234742AbhG2IJG (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Thu, 29 Jul 2021 04:09:06 -0400
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id E4EF33F224
        for <linux-omap@vger.kernel.org>; Thu, 29 Jul 2021 08:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1627546142;
        bh=pX0GUiuwzzSTMkJlt9aiUXfoWpo37Qw7A123srVFGm8=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=UX6h1DxWbIIyl2StbVyngsGHqNgLhXWSpIEMNKMMWebGFg5sMHHgB10xp1H8JZa5a
         bHB8SZKBkmQo0TsaU0j/q/gvkeD2JNdvGVuMhPQlluN2E02E2WYJh4J52f/cq9Y9eT
         HekWn0ucCtHp3ta4d6+lNWySQndsMNMm6JeotG25sb7KQgRYWN6PJaK+/n8cVRcm3I
         Ev73ezsxX9EgsQ14hIVZkiGnjwE47bHQslT4JCzO58NVDqeR/uNc7a2ebWg9yoxFkW
         JJJy+fdFMgHicoSFPirjofgSExzpDZXOiv50NJ1a3q+b5nJxaCpBK8z3gbA+bQ4NXC
         fTvDqUeTDz9eQ==
Received: by mail-ej1-f69.google.com with SMTP id g21-20020a1709061e15b029052292d7c3b4so1699968ejj.9
        for <linux-omap@vger.kernel.org>; Thu, 29 Jul 2021 01:09:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pX0GUiuwzzSTMkJlt9aiUXfoWpo37Qw7A123srVFGm8=;
        b=OfYwFKBsoqLqTa91xNdI9Nq0YLdq7xlaEHkMxLsSGejZcxZ/HOeEkcj6XQ0HsA/lhS
         DH4mkvi0R59GQL9AeR+bOXtFHwjfKmsKVYPWhy5zNQY44CkM3h2aK26bqAOJvNgIJ77e
         x8NcydHGMAhb2PBROJ3fSB9zg35PCQ6ZGsJn+/Jplnkj62DrHgA97wjgUhtb4zpVsu1o
         wpYD0H2CHTYROnepB4zbslqj/JstXDPBjkh3zc4kh24vM79Aot0zPf8Qb1M3tujpBJGh
         Zbso0aTmTpallc7CwYEXv2CPJQvs4G1gzgEjlH8rKCL6NX8wujibL06/Ggw8FnSxy0F6
         wi1A==
X-Gm-Message-State: AOAM530QFkbgDXc9kC8lozD0cym46/z7jvjHMzbeLTuvz0pzZZ2X9YxF
        GyHc4RfY/4mork4rNW0rc8FOQT7HBClANDgS2A9IhbGmLvyZEHP+ThNmI8Zle4nlfCuUZk3n3E0
        5GQ9drWA5qJHU5xS9FYxR9vzZiheg9krFiC05VTo=
X-Received: by 2002:aa7:dc18:: with SMTP id b24mr4609535edu.343.1627546142711;
        Thu, 29 Jul 2021 01:09:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmpo3iBtppsDWQ+SDU+gQ8Yq9WcMSaQt8FEeIKyOIytYdBKqTEsLijEgz6nCk8oW0uaD486w==
X-Received: by 2002:aa7:dc18:: with SMTP id b24mr4609523edu.343.1627546142595;
        Thu, 29 Jul 2021 01:09:02 -0700 (PDT)
Received: from localhost.localdomain ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id d26sm682040ejy.101.2021.07.29.01.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 01:09:02 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        Roger Quadros <rogerq@ti.com>,
        Roger Quadros <rogerq@kernel.org>
Subject: Re: [PATCH 1/2] memory: omap-gpmc: Clear GPMC_CS_CONFIG7 register on restore if unused
Date:   Thu, 29 Jul 2021 10:08:56 +0200
Message-Id: <162754613087.11315.7115451345895347944.b4-ty@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210727101034.32148-1-tony@atomide.com>
References: <20210727101034.32148-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, 27 Jul 2021 13:10:33 +0300, Tony Lindgren wrote:
> We want to clear any unused GPMC_CS_CONFIG7 register on restore to
> ensure unused chip selects are not enabled.

Applied, thanks!

[1/2] memory: omap-gpmc: Clear GPMC_CS_CONFIG7 register on restore if unused
      commit: 0f78964b523fe9920deae3455324060356ae53d0
[2/2] memory: omap-gpmc: Drop custom PM calls with cpu_pm notifier
      commit: 77ed5e9dec551765bde9f2e4b7ed9071ff03d61d

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
