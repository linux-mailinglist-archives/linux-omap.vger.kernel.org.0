Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C22C351A21
	for <lists+linux-omap@lfdr.de>; Thu,  1 Apr 2021 20:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236133AbhDAR6W (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 1 Apr 2021 13:58:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:57202 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236630AbhDARzA (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 1 Apr 2021 13:55:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7BD3861381;
        Thu,  1 Apr 2021 16:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617295057;
        bh=mSocOIXGvAFKcL19Ce6fU683sMoxx6GOB2FI63UFFps=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pfG4Ny5Naj2xO9xJs/GhyfkzUzVPEQeW7HePHaZfQpEBvHsMoE1lwGJBb/BJJTaxu
         LUTinilDjFtooZMZrmOLb/hUKZBguT8qdlqESp7Is4n7dJZVoo00lOu+jqlZFuehBv
         xFVWQB5fH6jYeAqP1RSl77oan6W2dBgFrNW/7Bbw5CaRaedgR8kecWxdJ+9v4+6kKX
         Vu0AG3AcvLjiGo6cASKJTWUltZn2tikCt7qkRAD6CxQSq5OynMTpNQNRDpoHoKuPlo
         Ey4SipMN6Cv/6ZK//nVQA7KzYcBsJJaHRBGp9lrar9wH/NdJxw/UUq5x7MiVzUIahF
         WAHIpad4zTH0w==
Date:   Thu, 1 Apr 2021 09:37:32 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Maciej Falkowski <maciej.falkowski9@gmail.com>
Cc:     aaro.koskinen@iki.fi, tony@atomide.com, linux@armlinux.org.uk,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH] ARM: OMAP1: ams-delta: remove unused function
 ams_delta_camera_power
Message-ID: <20210401163732.gl63gs2dpi6pickt@archlinux-ax161>
References: <20210401160434.7655-1-maciej.falkowski9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210401160434.7655-1-maciej.falkowski9@gmail.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Apr 01, 2021 at 06:04:34PM +0200, Maciej Falkowski wrote:
> The ams_delta_camera_power() function is unused as reports
> Clang compilation with omap1_defconfig on linux-next:
> 
> arch/arm/mach-omap1/board-ams-delta.c:462:12: warning: unused function 'ams_delta_camera_power' [-Wunused-function]
> static int ams_delta_camera_power(struct device *dev, int power)
>            ^
> 1 warning generated.
> 
> The soc_camera support was dropped without removing
> ams_delta_camera_power() function, making it unused.
> 
> Signed-off-by: Maciej Falkowski <maciej.falkowski9@gmail.com>
> Fixes: ce548396a433 ("media: mach-omap1: board-ams-delta.c: remove soc_camera dependencies")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1326

Thanks for the patch!

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  arch/arm/mach-omap1/board-ams-delta.c | 14 --------------
>  1 file changed, 14 deletions(-)
> 
> diff --git a/arch/arm/mach-omap1/board-ams-delta.c b/arch/arm/mach-omap1/board-ams-delta.c
> index 2ee527c00284..1026a816dcc0 100644
> --- a/arch/arm/mach-omap1/board-ams-delta.c
> +++ b/arch/arm/mach-omap1/board-ams-delta.c
> @@ -458,20 +458,6 @@ static struct gpiod_lookup_table leds_gpio_table = {
>  
>  #ifdef CONFIG_LEDS_TRIGGERS
>  DEFINE_LED_TRIGGER(ams_delta_camera_led_trigger);
> -
> -static int ams_delta_camera_power(struct device *dev, int power)
> -{
> -	/*
> -	 * turn on camera LED
> -	 */
> -	if (power)
> -		led_trigger_event(ams_delta_camera_led_trigger, LED_FULL);
> -	else
> -		led_trigger_event(ams_delta_camera_led_trigger, LED_OFF);
> -	return 0;
> -}
> -#else
> -#define ams_delta_camera_power	NULL
>  #endif
>  
>  static struct platform_device ams_delta_audio_device = {
> -- 
> 2.26.3
> 
