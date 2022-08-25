Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DBCA5A097D
	for <lists+linux-omap@lfdr.de>; Thu, 25 Aug 2022 09:09:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236745AbiHYHJB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 25 Aug 2022 03:09:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236760AbiHYHI6 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 25 Aug 2022 03:08:58 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CCBD7B297;
        Thu, 25 Aug 2022 00:08:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C5D22B826BB;
        Thu, 25 Aug 2022 07:08:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27030C433C1;
        Thu, 25 Aug 2022 07:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661411335;
        bh=Yb79srIHHHRqEV9IEdXHmJDug/ymtENp7GNc0jNwWjA=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=F1E98vqWoeZ0NL7MIOtc6T3GXoTpyxYuyfkQyoY/ekLRjhy2c9BuqLlW5FspVyTQF
         WjMO/i4JwRXOcQhQyDdZ5Wi8asOdepAkEo72/VjLmya9VvhPdUbVbwQTUoI6Ad2vFY
         jvpuZfnXHf4srDxtJphIVtX3oGDS4VzYHsoaS1tfzqnU++Yqt3ErwS9DuPW9pbi4/f
         0ZyzL8zhCuSW7MDYk+p+TUEgJs8Fh3psZeBc04aYyK3N5v6tpbOD46iIx/w5WMcYub
         Oba6203NPfWiZNwHhcPmNHcb9eBlidIfLl+R96sK0/aNKxiMMFYhhOl0Ghn1UYA5fo
         SN06who4/sAKA==
Message-ID: <d986aee3-9fd4-4f3b-f742-725833a70338@kernel.org>
Date:   Thu, 25 Aug 2022 10:08:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCHv2] ARM: dts: am5748: keep usb4_tm disabled
Content-Language: en-US
To:     Romain Naour <romain.naour@smile.fr>, linux-omap@vger.kernel.org
Cc:     devicetree@vger.kernel.org, bcousson@baylibre.com,
        tony@atomide.com, Romain Naour <romain.naour@skf.com>
References: <20220823072742.351368-1-romain.naour@smile.fr>
From:   Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20220823072742.351368-1-romain.naour@smile.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 23/08/2022 10:27, Romain Naour wrote:
> From: Romain Naour <romain.naour@skf.com>
> 
> Commit bcbb63b80284 ("ARM: dts: dra7: Separate AM57 dtsi files")
> disabled usb4_tm for am5748 devices since USB4 IP is not present
> in this SoC.
> 
> The commit log explained the difference between AM5 and DRA7 families:
> 
> AM5 and DRA7 SoC families have different set of modules in them so the
> SoC sepecific dtsi files need to be separated.
> 
> e.g. Some of the major differences between AM576 and DRA76
> 
> 		DRA76x	AM576x
> 
> USB3		x
> USB4		x
> ATL		x
> VCP		x
> MLB		x
> ISS		x
> PRU-ICSS1		x
> PRU-ICSS2		x
> 
> Then commit 176f26bcd41a ("ARM: dts: Add support for dra762 abz
> package") removed usb4_tm part from am5748.dtsi and introcuded new
> ti-sysc errors in dmesg:
> 
> ti-sysc 48940000.target-module: clock get error for fck: -2
> ti-sysc: probe of 48940000.target-module failed with error -2
> 
> Fixes: 176f26bcd41a ("ARM: dts: Add support for dra762 abz package")
> 
> Signed-off-by: Romain Naour <romain.naour@skf.com>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: Roger Quadros <rogerq@kernel.org>
> ---
> Issue reproduced on a AM5749 CPU using a 5.10 kernel from ti-linux-kernel:
> https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?h=linux-5.10.y
> 
> v2: improved commit log to ease patch backport
> ---
>  arch/arm/boot/dts/am5748.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Roger Quadros <rogerq@kernel.org>

cheers,
-roger
