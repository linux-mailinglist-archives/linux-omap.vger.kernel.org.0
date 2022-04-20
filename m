Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E318508E34
	for <lists+linux-omap@lfdr.de>; Wed, 20 Apr 2022 19:15:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380989AbiDTRQo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 20 Apr 2022 13:16:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380990AbiDTRQm (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 20 Apr 2022 13:16:42 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8142D457B0
        for <linux-omap@vger.kernel.org>; Wed, 20 Apr 2022 10:13:55 -0700 (PDT)
Received: from darkstar.musicnaut.iki.fi (85-76-69-216-nat.elisa-mobile.fi [85.76.69.216])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: aaro.koskinen)
        by meesny.iki.fi (Postfix) with ESMTPSA id B8C2720106;
        Wed, 20 Apr 2022 20:13:52 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1650474833;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=1swBvNttC6rdl/AjKVgPGBmjLQqrHRUZL3fL6fr9wM4=;
        b=MgMM0EL2iKboUHov92fo8jBqiQYm5ERDrW/MqbrtpIT7oLqKgaaqbz/lJWgtHVwbNpinS/
        nwIE5HE+NSRByJ1fYdgUWFAR9BPK5Pzj72c0nQv6F8hh4U5rqV0hsI0wpJQT3MqzHqMmL0
        IC4PIx8fhrLWH3pn7mZotnUrAg7xob0=
Date:   Wed, 20 Apr 2022 20:13:51 +0300
From:   Aaro Koskinen <aaro.koskinen@iki.fi>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Arnd Bergmann <arnd@arndb.de>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: omap1: Add Janusz as an additional
 maintainer
Message-ID: <20220420171351.GC1947@darkstar.musicnaut.iki.fi>
References: <20220413081656.27848-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220413081656.27848-1-tony@atomide.com>
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1650474833;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=1swBvNttC6rdl/AjKVgPGBmjLQqrHRUZL3fL6fr9wM4=;
        b=v3KOSRHrhWPrwhY5v76J02eZcU7TtOYq5UYVihmvdegdXmGfxKcJDKVNZR/nApDFOi5ml1
        SAQugN1RFz6rDXXmMUvvj0NsysQKrPhjb8f/YO39UcPj7yojqQe06m5/nuD4U1gGOWmzoy
        UeT9RBzwkzHfUxbhA20Wy+U0Sws+zLE=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1650474833; a=rsa-sha256; cv=none;
        b=VaAXQecumZ/CO+nQW+PdJH3YtPfxswTByhKcgDJUC40zbEPr+KtUfPb/p0+tz5/ulo517O
        SX9fydhd8DsHSm/t3kvfa44nET/V8wjc25j4m/ZCAiLCwOqGbSoG5zJn3rDGt72fddAR7d
        +tSvgy7xbsvRuoN90KN0XrkgxOPJ8iI=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On Wed, Apr 13, 2022 at 11:16:56AM +0300, Tony Lindgren wrote:
> Janusz has been active with improving and testing the omap1 SoC support
> and has been recently working on adding support for the common clock
> framework.
> 
> Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>

Acked-by: Aaro Koskinen <aaro.koskinen@iki.fi>

A.

> 
> ---
> 
> Janusz, does this sound OK to you? :)
> 
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14389,6 +14389,7 @@ F:	arch/arm/boot/dts/am335x-nano.dts
>  
>  OMAP1 SUPPORT
>  M:	Aaro Koskinen <aaro.koskinen@iki.fi>
> +M:	Janusz Krzysztofik <jmkrzyszt@gmail.com>
>  M:	Tony Lindgren <tony@atomide.com>
>  L:	linux-omap@vger.kernel.org
>  S:	Maintained
> -- 
> 2.35.1
