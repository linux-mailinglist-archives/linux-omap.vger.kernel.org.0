Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48FAC642FAE
	for <lists+linux-omap@lfdr.de>; Mon,  5 Dec 2022 19:16:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231990AbiLESQJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 5 Dec 2022 13:16:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231934AbiLESP7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 5 Dec 2022 13:15:59 -0500
Received: from sender11-of-o51.zoho.eu (sender11-of-o51.zoho.eu [31.186.226.237])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13E93205D1;
        Mon,  5 Dec 2022 10:15:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670264152; cv=none; 
        d=zohomail.eu; s=zohoarc; 
        b=K0O3z3F/QsD0Rk/2fzMDxblBmqyw+KM6XEmSN0+fB/l7p0QjrDAjiKQIoAuV2vdY+WM2XHs4Ixp4WLHyGsp009oKVZxrZupDmWMPS4HmxvXnlaRedeJiGxA7HYvEl+kl/wd/K/AmFMpoS+TfCFrNR3+K0BCMoYCm6HlwFBW+1Ds=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
        t=1670264152; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=7k4LEuG1PsM2sOEL2T0vRIxAqHEZrZj00zBPK+VWwuk=; 
        b=hAdpNMLmYuua2VZt4UlXkEzkHf3ugVtkwt5KD3eTgTC6EimRInN6xWZ7ncNdr4qjEqz4AziYI6ym3Q8z6+3Jxc+KQgaArAc6+WvVvwDIgrnVkz2aVAZVoAPzvPs0x4whpHw6dQRfqMKtmjZOL6utY8G+ppK/GheOXWeKoNgNuak=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
        spf=pass  smtp.mailfrom=philipp@uvos.xyz;
        dmarc=pass header.from=<philipp@uvos.xyz>
Received: from UVOSLinux (ip-095-222-026-177.um34.pools.vodafone-ip.de [95.222.26.177]) by mx.zoho.eu
        with SMTPS id 1670264149592460.12014936950334; Mon, 5 Dec 2022 19:15:49 +0100 (CET)
Date:   Mon, 5 Dec 2022 19:15:48 +0100
From:   Carl Philipp Klemm <philipp@uvos.xyz>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     linux-omap@vger.kernel.org, tony@atomide.com,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] leds: cpcap: make leds-cpcap an independent
 platform device to allow varying led setups
Message-Id: <20221205191548.13296b58d9121fec36769c97@uvos.xyz>
In-Reply-To: <20221205174857.asf6uant7ve7k5pe@mercury.elektranox.org>
References: <20221204104313.17478-1-philipp@uvos.xyz>
        <20221204104313.17478-2-philipp@uvos.xyz>
        <20221205174857.asf6uant7ve7k5pe@mercury.elektranox.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,FROM_SUSPICIOUS_NTLD,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

> I don't follow. Can't you just use 'status = "disabled;"' for the
> unavailable nodes?

Sure but unless im missing something, adding some nodes to a dts, one
for eatch led the device in question really has feals mutch better to
me than going arround and setting every led channel disabled for eatch
device that dosent use it. xt894 being the outlier here amoung the
cpcap devices we intend to support (xt894, xt860, xt875, xt910, xt912,
mb865, mz609 and mz617) in that it uses most of the extra led channels,
most of these use at most one (xt875, xt910, xt912, mb865) or zero
(mz609, mz617) extra channels.

Carl
