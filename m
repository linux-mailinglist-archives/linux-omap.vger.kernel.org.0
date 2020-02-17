Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B005D161CB8
	for <lists+linux-omap@lfdr.de>; Mon, 17 Feb 2020 22:20:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728543AbgBQVUb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Feb 2020 16:20:31 -0500
Received: from muru.com ([72.249.23.125]:55680 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728254AbgBQVUb (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 17 Feb 2020 16:20:31 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 5C8B38087;
        Mon, 17 Feb 2020 21:21:14 +0000 (UTC)
Date:   Mon, 17 Feb 2020 13:20:27 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        Kees Cook <keescook@chromium.org>,
        Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Merlijn Wajer <merlijn@wizzup.org>, linux-omap@vger.kernel.org
Subject: Re: [PATCH] arm: fix Kbuild issue caused by per-task stack protector
 GCC plugin
Message-ID: <20200217211953.GA35972@atomide.com>
References: <20200217203013.20102-1-ardb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200217203013.20102-1-ardb@kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Ard Biesheuvel <ardb@kernel.org> [200217 20:31]:
> When using plugins, GCC requires that the -fplugin= options precedes
> any of its plugin arguments appearing on the command line as well.
> This is usually not a concern, but as it turns out, this requirement
> is causing some issues with ARM's per-task stack protector plugin
> and Kbuild's implementation of $(cc-option).
> 
> When the per-task stack protector plugin is enabled, and we tweak
> the implementation of cc-option not to pipe the stderr output of
> GCC to /dev/null, the following output is generated when GCC is
> executed in the context of cc-option:
> 
>   cc1: error: plugin arm_ssp_per_task_plugin should be specified before \
>          -fplugin-arg-arm_ssp_per_task_plugin-tso=1 in the command line
>   cc1: error: plugin arm_ssp_per_task_plugin should be specified before \
>          -fplugin-arg-arm_ssp_per_task_plugin-offset=24 in the command line
> 
> These errors will cause any option passed to cc-option to be treated
> as unsupported, which is obviously incorrect.
> 
> The cause of this issue is the fact that the -fplugin= argument is
> added to GCC_PLUGINS_CFLAGS, whereas the arguments above are added
> to KBUILD_CFLAGS, and the contents of the former get filtered out of
> the latter before being passed to the GCC running the cc-option test,
> and so the -fplugin= option does not appear at all on the GCC command
> line.
> 
> Adding the arguments to GCC_PLUGINS_CFLAGS instead of KBUILD_CFLAGS
> would be the correct approach here, if it weren't for the fact that we
> are using $(eval) to defer the moment that they are added until after
> asm-offsets.h is generated, which is after the point where the contents
> of GCC_PLUGINS_CFLAGS are added to KBUILD_CFLAGS. So instead, we have
> to add our plugin arguments to both.
> 
> For similar reasons, we cannot append DISABLE_ARM_SSP_PER_TASK_PLUGIN
> to KBUILD_CFLAGS, as it will be passed to GCC when executing in the
> context of cc-option, whereas the other plugin arguments will have
> been filtered out, resulting in a similar error and false negative
> result as above. So add it to ccflags-y instead.
> 
> Reported-by: Tony Lindgren <tony@atomide.com>
> Fixes: 189af4657186da08 ("ARM: smp: add support for per-task stack canaries")
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

This fixes the appended dtb boot test case for me:

Tested-by: Tony Lindgren <tony@atomide.com>

Also adding Merlijn also to Cc to test his, he originally
reported the issue. So I suggest you please also add:

Reported-by: Merlijn Wajer <merlijn@wizzup.org>

Regards,

Tony


> ---
>  arch/arm/Makefile                 | 4 +++-
>  arch/arm/boot/compressed/Makefile | 4 ++--
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/Makefile b/arch/arm/Makefile
> index db857d07114f..1fc32b611f8a 100644
> --- a/arch/arm/Makefile
> +++ b/arch/arm/Makefile
> @@ -307,13 +307,15 @@ endif
>  ifeq ($(CONFIG_STACKPROTECTOR_PER_TASK),y)
>  prepare: stack_protector_prepare
>  stack_protector_prepare: prepare0
> -	$(eval KBUILD_CFLAGS += \
> +	$(eval SSP_PLUGIN_CFLAGS := \
>  		-fplugin-arg-arm_ssp_per_task_plugin-tso=$(shell	\
>  			awk '{if ($$2 == "THREAD_SZ_ORDER") print $$3;}'\
>  				include/generated/asm-offsets.h)	\
>  		-fplugin-arg-arm_ssp_per_task_plugin-offset=$(shell	\
>  			awk '{if ($$2 == "TI_STACK_CANARY") print $$3;}'\
>  				include/generated/asm-offsets.h))
> +	$(eval KBUILD_CFLAGS += $(SSP_PLUGIN_CFLAGS))
> +	$(eval GCC_PLUGINS_CFLAGS += $(SSP_PLUGIN_CFLAGS))
>  endif
>  
>  all:	$(notdir $(KBUILD_IMAGE))
> diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/boot/compressed/Makefile
> index da599c3a1193..9c11e7490292 100644
> --- a/arch/arm/boot/compressed/Makefile
> +++ b/arch/arm/boot/compressed/Makefile
> @@ -101,7 +101,6 @@ clean-files += piggy_data lib1funcs.S ashldi3.S bswapsdi2.S \
>  		$(libfdt) $(libfdt_hdrs) hyp-stub.S
>  
>  KBUILD_CFLAGS += -DDISABLE_BRANCH_PROFILING
> -KBUILD_CFLAGS += $(DISABLE_ARM_SSP_PER_TASK_PLUGIN)
>  
>  ifeq ($(CONFIG_FUNCTION_TRACER),y)
>  ORIG_CFLAGS := $(KBUILD_CFLAGS)
> @@ -117,7 +116,8 @@ CFLAGS_fdt_ro.o := $(nossp-flags-y)
>  CFLAGS_fdt_rw.o := $(nossp-flags-y)
>  CFLAGS_fdt_wip.o := $(nossp-flags-y)
>  
> -ccflags-y := -fpic $(call cc-option,-mno-single-pic-base,) -fno-builtin -I$(obj)
> +ccflags-y := -fpic $(call cc-option,-mno-single-pic-base,) -fno-builtin \
> +	     -I$(obj) $(DISABLE_ARM_SSP_PER_TASK_PLUGIN)
>  asflags-y := -DZIMAGE
>  
>  # Supply kernel BSS size to the decompressor via a linker symbol.
> -- 
> 2.17.1
> 
