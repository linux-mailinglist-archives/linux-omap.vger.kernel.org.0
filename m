Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89C11824E3
	for <lists+linux-omap@lfdr.de>; Mon,  5 Aug 2019 20:32:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730065AbfHEScA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 5 Aug 2019 14:32:00 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:44889 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728831AbfHEScA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 5 Aug 2019 14:32:00 -0400
Received: by mail-pf1-f194.google.com with SMTP id t16so40038111pfe.11
        for <linux-omap@vger.kernel.org>; Mon, 05 Aug 2019 11:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=GAZtoqMTbDsSEkTKLvtg+7SDqJDueQbXtR/WE8SM+Mc=;
        b=eLCpJfoh/+Lkf3U5Jq1Gw1cvSEsPrPw2J+Jj1cKEaDJJOhXr0kqg4nEbozdiW9YyZW
         MxwXt8S6yghOSjDY3p0XzVPZkQ9IDX8wNCa+Qv6vXmaUTiEb+PublVJvS7pSWJGp8KEx
         w9HQXI6qhlsTEtJk/CdDPSdHkxIWQIH6hjn96/vYSQJ8y01/RqngcS6Oq2O9DA5M5rVN
         fvxg1/cP+66yiU9OGP3cgIMltSY6quBi6snXE8Lh6SdljDPnXzTsPpnLyTbyUbk8aWam
         aCjEgEpKTEI7REjqoFE/WpbKcnCBuJMhe6vk5dAdvMc2bGkn8nFYuZ1PobjwNlCPV9X1
         L22A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=GAZtoqMTbDsSEkTKLvtg+7SDqJDueQbXtR/WE8SM+Mc=;
        b=U3l4crAhcp4ytCL6h7p8w2SdkB2vD1e/VgExbcZ6Y/mprAjuwmU0pRXh826Zk+Jh0f
         F8KQKN9y6fE9EzJL49859clcpf1RAPmQZNtxg+DBvTmX+mMo5iEUH7BnNeT+ngiTrrs5
         WUqBAwlwvjo2san5dmvxg/g3BzhN4NXYuomtIK970a53q1zDt8hAjxWFCgssAEDJleWs
         aHWMRBJQTNgWiKmVQlGylXMXgAn4qbfQMibPmXdm6uFKNW32VCsu3LlElTqWXCs7K1N6
         tNOmbl9xvbiEAKuA4Ck64pq162nQ8/bsTBzc9gRV8M3aI0xidIGsPcwCvWDRolrPKHnE
         1Z/w==
X-Gm-Message-State: APjAAAX/Hk7iTJMjwshbr4+RNg5a3AScrD3QGkN4lm01Mooyju3yw12h
        zAaXNdHKJi3U4KSDI1BxYxJOJg==
X-Google-Smtp-Source: APXvYqy5L3JR07HcEnA00M1CL8VNhKg77fHOWXFhUU5EGpQJP/FGGVXDbvKX2iSPUCmowPs/39oslw==
X-Received: by 2002:a63:c118:: with SMTP id w24mr136487259pgf.347.1565029919532;
        Mon, 05 Aug 2019 11:31:59 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:7483:80d6:7f67:2672])
        by smtp.googlemail.com with ESMTPSA id a1sm51592199pgh.61.2019.08.05.11.31.58
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Aug 2019 11:31:58 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Chuhong Yuan <hslester96@gmail.com>
Cc:     Russell King <linux@armlinux.org.uk>,
        Tony Lindgren <tony@atomide.com>,
        Kevin Hilman <khilman@kernel.org>,
        Alexander Clouter <alex@digriz.org.uk>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, Chuhong Yuan <hslester96@gmail.com>
Subject: Re: [PATCH] ARM: Replace strncmp with str_has_prefix
In-Reply-To: <20190730024426.17262-1-hslester96@gmail.com>
References: <20190730024426.17262-1-hslester96@gmail.com>
Date:   Mon, 05 Aug 2019 11:31:57 -0700
Message-ID: <7hzhknh3aa.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Chuhong Yuan <hslester96@gmail.com> writes:

> In commit b6b2735514bc
> ("tracing: Use str_has_prefix() instead of using fixed sizes")
> the newly introduced str_has_prefix() was used
> to replace error-prone strncmp(str, const, len).
> Here fix codes with the same pattern.
>
> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
> ---
>  arch/arm/kernel/module-plts.c        | 2 +-
>  arch/arm/mach-omap2/omap_device.c    | 4 ++--
>  arch/arm/mach-omap2/pm-debug.c       | 8 ++++----
>  arch/arm/mach-omap2/pm.c             | 2 +-
>  arch/arm/mach-omap2/pm44xx.c         | 2 +-
>  arch/arm/mach-omap2/sr_device.c      | 8 ++++----
>  arch/arm/mach-orion5x/ts78xx-setup.c | 4 ++--

For the OMAP stuff:

Reviewed-by: Kevin Hilman <khilman@baylibre.com>  # arch/arm/mach-omap2/*

Kevin
