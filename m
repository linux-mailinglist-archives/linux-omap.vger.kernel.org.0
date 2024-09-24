Return-Path: <linux-omap+bounces-2240-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6946E984A02
	for <lists+linux-omap@lfdr.de>; Tue, 24 Sep 2024 18:52:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A8D61C20BDE
	for <lists+linux-omap@lfdr.de>; Tue, 24 Sep 2024 16:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAE441ABEC0;
	Tue, 24 Sep 2024 16:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="BE4FaaLB"
X-Original-To: linux-omap@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3EC1A265D;
	Tue, 24 Sep 2024 16:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727196733; cv=none; b=D3uOmw7cVpHPSwHmqfYnsWeRPt/sQn1hFT98bMUBcNplbWw8LW8wW4anRRAseKZLGGDp8kszJqqcxcge1L+p2bMbURnxZAchHZ9HO7chnGmmvAzNdg0VEZPHZK6UVd/nmyQh6uvMBoNQasA0j+23dFVfONshoLjv+3vAxY8l/ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727196733; c=relaxed/simple;
	bh=8iDPaWel+pdHTsoyWlGxncS4Ko0Ek2fo6ErMWjypTaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HDIFcQDsB07qajIYBMMxduqIGTQAZlGCKfi8bQm5wVigDDZ2i9MGL/oeH7qfKwBKiNC5F1DzGhdrGgfdwaagjqOUgQ4ZvWtJ+XhYYX69x185v282Lhow2e5xwa1NiNJXaVQ40FKRscW7ReTIQu2DWaz0FISjoO0p/Hn35qzsKcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=BE4FaaLB; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KyJjheGAjypbHgOz2sBZ/DaTwBD+LkgwhOrIrfFbTuw=; b=BE4FaaLB+ITgp5tuo9upo3QSIb
	Q0blx/GUFryJNfvom1vr7TSA67py8n4Sg9q2NX/DHxX4tgSxOHv7HXSpVvpIpX8M37JmdRuLMPChN
	L2J5o+2W+WE48Bh+qASiXbl1k+4rsPCQ3w9rMmxiZVyz8UYvoqysYCKh4AP2J4zSbgCBDZr8TnJca
	imteOnZ32WUZpJyeEB4G14L+rEtrBvayAumQFXh4I86iowRbmlue/utmWd+1hKaiIpuHTShFO2veV
	IQ5RoJSpcmOZ+FtESzGVE8XPSPDFBTM6k52Rc9iHf60zpAn8+R0t+YsS/N1OW8dnpwwZOm56e3j6J
	GRMfWojQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:32962)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1st8lg-0005hC-22;
	Tue, 24 Sep 2024 17:52:04 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1st8lc-0006WN-14;
	Tue, 24 Sep 2024 17:52:00 +0100
Date: Tue, 24 Sep 2024 17:52:00 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-omap@vger.kernel.org,
	linux-clk@vger.kernel.org, Paul Walmsley <paul@pwsan.com>,
	Tony Lindgren <tony@atomide.com>
Subject: Re: clk mess on omap4460 with mpu clock
Message-ID: <ZvLuMJxv8a0h9gpq@shell.armlinux.org.uk>
References: <20240603234139.280629b2@aktux>
 <CAMuHMdWU74DsWEZtZQJctQQog=9UCG_1LZu5yWvyxx0Zw4LQow@mail.gmail.com>
 <20240903143357.2532258b@akair>
 <CAMuHMdWF4G5Uon1=6TMzBogN2CX8EuiVBMuCPtAAMPNa-DtiOw@mail.gmail.com>
 <20240903192203.1dddbf0d@akair>
 <ZtdQ+Ay9DKAooahN@shell.armlinux.org.uk>
 <20240923140447.60c5efff@akair>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923140447.60c5efff@akair>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Mon, Sep 23, 2024 at 02:04:47PM +0200, Andreas Kemnade wrote:
> The main question what bothers me is whether we have
> some real problems behind it. The warning message is just an indicator
> of something odd which was already odd before the message was
> introduced.

Indeed.

> I have seen something working with some u-boot and some other not,
> so things might not get properly initialized... 
> 
> So the way forward is to check whether that registration is really
> needed at:
> https://elixir.bootlin.com/linux/v6.11/source/drivers/bus/ti-sysc.c#L2380
> If yes, then
> a) increade the size of the name in the clk subsystem or
> b) workaround like
> https://elixir.bootlin.com/linux/v6.11/source/drivers/bus/ti-sysc.c#L353

Or we make the arrays larger - at the moment, the struct is a nice round
64 bytes in 32-bit systems - 6 pointers (24 bytes) plus 24 plus 16 = 64.
For 64-bit systems, this is 88 bytes.

An alternative approach may be this (untested, not even compile tested):

diff --git a/drivers/clk/clkdev.c b/drivers/clk/clkdev.c
index 2f83fb97c6fb..222f0ccf9fc0 100644
--- a/drivers/clk/clkdev.c
+++ b/drivers/clk/clkdev.c
@@ -149,8 +149,7 @@ void clkdev_add_table(struct clk_lookup *cl, size_t num)
 
 struct clk_lookup_alloc {
 	struct clk_lookup cl;
-	char	dev_id[MAX_DEV_ID];
-	char	con_id[MAX_CON_ID];
+	char	strings[0];
 };
 
 static struct clk_lookup * __ref
@@ -158,60 +157,36 @@ vclkdev_alloc(struct clk_hw *hw, const char *con_id, const char *dev_fmt,
 	va_list ap)
 {
 	struct clk_lookup_alloc *cla;
-	struct va_format vaf;
-	const char *failure;
 	va_list ap_copy;
-	size_t max_size;
-	ssize_t res;
+	size_t size;
+	char *strp;
 
-	cla = kzalloc(sizeof(*cla), GFP_KERNEL);
+	size = sizeof(*cla);
+	if (con_id)
+		size += 1 + strlen(con_id);
+	if (dev_fmt) {
+		va_copy(ap_copy, ap);
+		size += 1 + vsprintf(NULL, dev_fmt, ap_copy);
+		va_end(ap_copy);
+	}
+
+	cla = kzalloc(size, GFP_KERNEL);
 	if (!cla)
 		return NULL;
 
-	va_copy(ap_copy, ap);
-
 	cla->cl.clk_hw = hw;
+	strp = cla->strings;
 	if (con_id) {
-		res = strscpy(cla->con_id, con_id, sizeof(cla->con_id));
-		if (res < 0) {
-			max_size = sizeof(cla->con_id);
-			failure = "connection";
-			goto fail;
-		}
-		cla->cl.con_id = cla->con_id;
+		strcpy(strp, con_id);
+		cla->cl.con_id = strp;
+		strp += 1 + strlen(con_id);
 	}
 
 	if (dev_fmt) {
-		res = vsnprintf(cla->dev_id, sizeof(cla->dev_id), dev_fmt, ap);
-		if (res >= sizeof(cla->dev_id)) {
-			max_size = sizeof(cla->dev_id);
-			failure = "device";
-			goto fail;
-		}
-		cla->cl.dev_id = cla->dev_id;
+		vsprintf(strp, dev_fmt, ap);
+		cla->cl.dev_id = strp;
 	}
 
-	va_end(ap_copy);
-
-	return &cla->cl;
-
-fail:
-	if (dev_fmt)
-		vaf.fmt = dev_fmt;
-	else
-		vaf.fmt = "null-device";
-	vaf.va = &ap_copy;
-	pr_err("%pV:%s: %s ID is greater than %zu\n",
-	       &vaf, con_id, failure, max_size);
-	va_end(ap_copy);
-
-	/*
-	 * Don't fail in this case, but as the entry won't ever match just
-	 * fill it with something that also won't match.
-	 */
-	strscpy(cla->con_id, "bad", sizeof(cla->con_id));
-	strscpy(cla->dev_id, "bad", sizeof(cla->dev_id));
-
 	return &cla->cl;
 }
 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

