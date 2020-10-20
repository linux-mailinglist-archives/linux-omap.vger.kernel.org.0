Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8267F293B9E
	for <lists+linux-omap@lfdr.de>; Tue, 20 Oct 2020 14:31:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406034AbgJTMbV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 20 Oct 2020 08:31:21 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38095 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394373AbgJTMbU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 20 Oct 2020 08:31:20 -0400
Received: by mail-wm1-f67.google.com with SMTP id b127so1670221wmb.3;
        Tue, 20 Oct 2020 05:31:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3CBkp9wh8pC8AE+JuGneoDSmlRYGKaXzA/ZH4H7EC8I=;
        b=YFZ/EBspnX4VGk7G8oi1NnoqOFH0f5ZCaKFVxbOr8CaTjZ9TcJjgWuMY8HnXo+zZYu
         Be8dokwdyLZINPQ1L+QtnLBYb9ubu4AK6lDvn7E9hJuQIbAUJ7xktAN2NmC3zbRdb1yL
         QsLD9JOvU5sEiiNRqj9gT+w/Fp3IRvrFAJjA9f1CcBksFoNImlqEYctnxB3Z8d2k5t04
         L4hdExwbEU3pfbTjW6JL6rfCwKVwQBAISzXtPU7N5okusmu41a8tVL+ZV0S/gVGry/eJ
         HjcWc221MT35H9fgjHZNZCSBrlwaEqnmcZSGLhsrNkFnLGlKD/9NiU0FRmNvTV9yUorV
         tJnw==
X-Gm-Message-State: AOAM531Z9nf9Q98Sh+LyIuBxkQo+gXjAmmRlLLU3XdM6UZIgUl8QTN7f
        6SOc20iy79P+3zhTruEE13M=
X-Google-Smtp-Source: ABdhPJz7v2CQrMv1UeA209tUYKORZKIkNjPVZDyOy0NQgDNWRKVmgrZn2wqsWApZ6lfAW+35MKsbfQ==
X-Received: by 2002:a1c:2586:: with SMTP id l128mr2718275wml.49.1603197078260;
        Tue, 20 Oct 2020 05:31:18 -0700 (PDT)
Received: from kozik-lap ([194.230.155.171])
        by smtp.googlemail.com with ESMTPSA id t5sm2877491wrb.21.2020.10.20.05.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2020 05:31:16 -0700 (PDT)
Date:   Tue, 20 Oct 2020 14:31:14 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH 03/29] arm: dts: am437x: Correct DWC USB3 compatible
 string
Message-ID: <20201020123114.GB127386@kozik-lap>
References: <20201020115959.2658-1-Sergey.Semin@baikalelectronics.ru>
 <20201020115959.2658-4-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201020115959.2658-4-Sergey.Semin@baikalelectronics.ru>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Oct 20, 2020 at 02:59:33PM +0300, Serge Semin wrote:
> Syonpsys IP cores are supposed to be defined with "snps" vendor-prefix.
> Use it instead of the deprecated "synopsys" one.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> ---
>  arch/arm/boot/dts/am437x-l4.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
