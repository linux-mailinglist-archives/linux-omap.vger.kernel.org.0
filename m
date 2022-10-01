Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D27BB5F16F5
	for <lists+linux-omap@lfdr.de>; Sat,  1 Oct 2022 02:11:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232118AbiJAALt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 30 Sep 2022 20:11:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231233AbiJAALt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 30 Sep 2022 20:11:49 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ADFD1BC638;
        Fri, 30 Sep 2022 17:11:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D2AFFB82AB8;
        Sat,  1 Oct 2022 00:11:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E746C433D6;
        Sat,  1 Oct 2022 00:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664583105;
        bh=dHuJfhswjk9HDEFJFlVB0y8DZKNvo57KKJVoSnjXf8E=;
        h=In-Reply-To:References:Subject:From:To:Date:From;
        b=iWveKIVieFlyf3OFC6pWZK+Dwr9l90MCC1Sk6PrRQKqap+PxstDgx5/Z92pYYTX9t
         GRx3+NvXefToBDPyWotZUqP7/RAlr98bVLE31OWuh00FjoYZWcWwfOBtAZ15ZUG/Ub
         0DWMkAGQsh56NCosX1Ecx258eaOXr92DjhQaCLmdXb92xKec6ldf/O5ncBqQFAu3yW
         tsMcZGdSKIZeCkbHmmeXPwKr6qh73fljywVN02SVb2FcxVH8GdvxhenEAgQw9tYZvW
         fA2tZXQN2x0I+5btXiyrHWbX2hT7ZKW/tu3s1Wzh9H9SafkXZDKClRqDeoeiq1Zcrb
         ITqzlahWTMZpg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220915031121.4003589-1-windhl@126.com>
References: <20220915031121.4003589-1-windhl@126.com>
Subject: Re: [PATCH] clk: ti: Call of_node_get() before of_find_xxx() API
From:   Stephen Boyd <sboyd@kernel.org>
To:     kristo@kernel.org, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org, mturquette@baylibre.com, windhl@126.com
Date:   Fri, 30 Sep 2022 17:11:43 -0700
User-Agent: alot/0.10
Message-Id: <20221001001145.7E746C433D6@smtp.kernel.org>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Liang He (2022-09-14 20:11:21)
> In ti_find_clock_provider(), we need to call of_node_get() for
> of_find_node_by_name() which will automatically call of_node_put()
> for the 'from' argument.
>=20
> Fixes: 51f661ef9a10 ("clk: ti: Add ti_find_clock_provider() to use clock-=
output-names")
> Signed-off-by: Liang He <windhl@126.com>
> ---
>  drivers/clk/ti/clk.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/clk/ti/clk.c b/drivers/clk/ti/clk.c
> index 373e9438b57a..7c390cd67e1a 100644
> --- a/drivers/clk/ti/clk.c
> +++ b/drivers/clk/ti/clk.c
> @@ -147,6 +147,7 @@ static struct device_node *ti_find_clock_provider(str=
uct device_node *from,
>                 return np;
> =20
>         /* Fall back to using old node name base provider name */
> +       of_node_get(from);

It seems better to hold the reference from the earlier search.

>         return of_find_node_by_name(from, name);
>  }

How about this?

----8<----
diff --git a/drivers/clk/ti/clk.c b/drivers/clk/ti/clk.c
index ef2a445c63a3..a99279265e40 100644
--- a/drivers/clk/ti/clk.c
+++ b/drivers/clk/ti/clk.c
@@ -139,11 +139,12 @@ static struct device_node *ti_find_clock_provider(str=
uct device_node *from,
 			break;
 		}
 	}
-	of_node_put(from);
 	kfree(tmp);
=20
-	if (found)
+	if (found) {
+		of_node_put(from);
 		return np;
+	}
=20
 	/* Fall back to using old node name base provider name */
 	return of_find_node_by_name(from, name);
