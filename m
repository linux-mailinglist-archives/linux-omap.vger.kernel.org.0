Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1F2232B54
	for <lists+linux-omap@lfdr.de>; Mon,  3 Jun 2019 11:03:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727137AbfFCJDW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 3 Jun 2019 05:03:22 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33521 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726902AbfFCJDW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 3 Jun 2019 05:03:22 -0400
Received: by mail-wr1-f66.google.com with SMTP id d9so11184563wrx.0
        for <linux-omap@vger.kernel.org>; Mon, 03 Jun 2019 02:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=a1mkYyCrc83Bv+zphH07Gxd4PhX3LAFjUYuUVnAFGYo=;
        b=OoWqRLOmDPj+mmfUzNKkgrBa1E+ijOzEbzhu5ES63kGonC2+w9C1xHgRl/W/MdjyQB
         XvMHc6AXeQAWOTbVT/oaZZbrxXorwdeM0quSC7VEcxmcTCzlEQuLSQhGSuCN45Xmhg8L
         mopTvWxvFVt3zkhzxu5H7sueSAJbCkGw1bV5LDHrhRQ/YfjMA769es6a8zMwL4CaCz76
         ZZc/5mEUvw1ERXRow49PggplOBB2aNF8nD62x69CfjFidi48YDz4zimyI86UkfgnE+My
         8JFoqUi2uW/FG7o0zbMX6h9FzVfeyzo4xeoBPWFNHnF/ZA/Okb3uMRVygXWjYM6CxnH3
         QXYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=a1mkYyCrc83Bv+zphH07Gxd4PhX3LAFjUYuUVnAFGYo=;
        b=o5a/2fdzwxLjeSeGY6Wz4Bb9je9VJ3f0VxTQcYSVzBCiPpiV/pziSkDVfiblSS6tQr
         gsv1L9nXSeCPAnoiaJRKyCjj3XpHScyao7J/QJZK4oZ1Q0yK+WpgNu+qnHJWK3LShnQp
         htOjA/+Sva0TOjan52f4CpqeyTENBNiBoGPy4nR9Wzbn6krAkr5+grFT+z8jaXaiZgxQ
         6VPzQjlpqp00AKawxZ6BX+VHUVrJoJ7E+ydwzyjnZ7wq97LQZ+g00NZpiGTttbK1ulxM
         hw3y50hSIkMR3fYVUcpcRQl0wkOMNcW6wGJJjyV1caFtt63Ial7vFd2A3I0Wei7a7m5T
         f3Ww==
X-Gm-Message-State: APjAAAUm8HXAjpXY8KMz05OdNcWMN2ELS6PvWPKpVp1CvY7RdvvuCXNF
        Jnu4q7jvUzGS4Hl1lS4GMVM0D0pNUG0=
X-Google-Smtp-Source: APXvYqwFDCLsbQ/QRNN1gOWGbULHl5E+WHYuirmI65LmDirQ7atTzHodX99UNEbk9EtG2HUCL/9C0w==
X-Received: by 2002:adf:9cd0:: with SMTP id h16mr1539930wre.211.1559552600653;
        Mon, 03 Jun 2019 02:03:20 -0700 (PDT)
Received: from dell ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id 65sm28726567wro.85.2019.06.03.02.03.19
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Jun 2019 02:03:20 -0700 (PDT)
Date:   Mon, 3 Jun 2019 10:03:18 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Keerthy <j-keerthy@ti.com>
Cc:     robh+dt@kernel.org, broonie@kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org, t-kristo@ti.com
Subject: Re: [PATCH 2/3] mfd: lp87565: Add support for 4-phase lp87561
 combination
Message-ID: <20190603090318.GI4797@dell>
References: <20190515100848.19560-1-j-keerthy@ti.com>
 <20190515100848.19560-3-j-keerthy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190515100848.19560-3-j-keerthy@ti.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, 15 May 2019, Keerthy wrote:

> Add support for 4-phase lp87561 combination.
> 
> Data Sheet: https://www.ti.com/lit/ds/symlink/lp87561-q1.pdf
> 
> Signed-off-by: Keerthy <j-keerthy@ti.com>
> ---
>  drivers/mfd/lp87565.c       | 4 ++++
>  include/linux/mfd/lp87565.h | 2 ++
>  2 files changed, 6 insertions(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
